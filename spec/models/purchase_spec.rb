require 'rails_helper'

describe Purchase do
  describe 'attributes' do
    it 'should have a product_id db column' do
      expect(subject).to have_db_column(:product_id).of_type :integer
    end

    it 'should have a merchant_id db column' do
      expect(subject).to have_db_column(:merchant_id).of_type :integer
    end

    it 'should have a purchaser_id db column' do
      expect(subject).to have_db_column(:purchaser_id).of_type :integer
    end

    it 'should have an created_at db column' do
      expect(subject).to have_db_column(:created_at).of_type :datetime
    end

    it 'should have an updated_at db column' do
      expect(subject).to have_db_column(:updated_at).of_type :datetime
    end
  end

  describe 'validations' do
    it 'should validate the presence of the purchaser' do
      expect(subject).to validate_presence_of :purchaser
    end

    it 'should validate the presence of the product' do
      expect(subject).to validate_presence_of :product
    end

    it 'should validate the presence of the merchant' do
      expect(subject).to validate_presence_of :merchant
    end

    it 'should validate the presence of the count' do
      expect(subject).to validate_presence_of :count
    end

    it 'should validate the presence of the price_in_cents' do
      expect(subject).to validate_presence_of :price_in_cents
    end
  end

  describe 'associations' do
    it 'should belong to a purchaser' do
      expect(subject).to belong_to :purchaser
    end

    it 'should belong to a product' do
      expect(subject).to belong_to :product
    end

    it 'should belong to a merchant' do
      expect(subject).to belong_to :merchant
    end
  end
end
