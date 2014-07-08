require 'rails_helper'

describe Product do
  describe 'attributes' do
    it 'should have a name db column' do
      expect(subject).to have_db_column(:name).of_type :string
    end

    it 'should have an created_at db column' do
      expect(subject).to have_db_column(:created_at).of_type :datetime
    end

    it 'should have an updated_at db column' do
      expect(subject).to have_db_column(:updated_at).of_type :datetime
    end
  end

  describe 'validations' do
    it 'should validate the presence of the name' do
      expect(subject).to validate_presence_of :name
    end
  end

  describe 'associations' do
    it 'should have many purchases' do
      expect(subject).to have_many :purchases
    end
  end
end
