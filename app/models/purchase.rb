class Purchase < ActiveRecord::Base
  belongs_to :purchaser
  belongs_to :merchant
  belongs_to :product

  validates :purchaser, :merchant, :product, :price_in_cents, :count, presence: true

  def price
    price_in_cents/100.0
  end
end
