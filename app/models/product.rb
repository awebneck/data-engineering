class Product < ActiveRecord::Base
  # the price is associated with the purchase, not the
  # product, as a product's price may change over time

  has_many :purchases

  validates :name, presence: true
end
