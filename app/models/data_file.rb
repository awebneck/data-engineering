class DataFile
  HEADERS = [
    :purchaser_name,
    :item_description,
    :item_price,
    :purchase_count,
    :merchant_address,
    :merchant_name
  ]
  WIPE_INTERVAL = 250

  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :file

  validates :file, presence: true

  def save
    return false unless valid?
    parse_file
  end

  def gross_revenue
    @gross_revenue_in_cents/100.0
  end

  private

  def parse_file
    file.rewind
    purchase_data = file.read.split(/\n/)[1..-1].map { |s| s.split(/\t/) }
    @gross_revenue_in_cents = 0
    last_record = 0

    # Ensure the file is handled transactionally so any errors can be
    # corrected and the file reuploaded.
    ActiveRecord::Base.transaction do
      purchase_data.each_with_index do |pd, i|
        last_record = i

        # Wipe the query cache every WIPE_INTERVAL records to ensure we
        # don't blow memory. I'd rather the thing take a while then fail
        # because somebody uploaded something massive.
        ActiveRecord::Base.connection.clear_query_cache if i % WIPE_INTERVAL == 0

        # AR query cache should hit on dupe records, ensuring find queries
        # are not issued twice for the same record.
        purchaser = Purchaser.find_or_create_by! name: pd[0]
        product = Product.find_or_create_by! name: pd[1]
        merchant = Merchant.find_or_create_by! name: pd[5], address: pd[4]

        # Using the to_r rational cast here, to ensure we don't have to
        # contend with floating point rounding errors.
        p = Purchase.create! product: product, merchant: merchant, purchaser: purchaser, price_in_cents: (pd[2].to_r*100).to_i, count: pd[3]
        @gross_revenue_in_cents += p.count*p.price_in_cents
      end
    end
    true
  rescue ActiveRecord::RecordInvalid
    errors.add :file, "Invalid record in file on line #{last_record + 1}."
    false
  end
end
