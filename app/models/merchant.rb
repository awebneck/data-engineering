class Merchant < ActiveRecord::Base
  # Merchants are identified by their name *and*
  # address. If they need to be consolidated by
  # one or the other, that can be done later when
  # requirements are clearer.

  has_many :purchases

  validates :name, :address, presence: true
end
