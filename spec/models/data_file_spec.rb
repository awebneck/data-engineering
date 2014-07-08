require 'rails_helper'

describe DataFile do
  describe 'validations' do
    it 'should be invalid without a file' do
      expect(subject).to validate_presence_of :file
    end
  end

  describe "persistence" do
    let(:file) { File.open "#{Rails.root}/spec/resources/example_input.tab", "r" }
    let!(:datafile) { DataFile.new file: file }

    before(:each) { datafile.save }

    it "should normalize and persist all purchasers by name" do
      expect(Purchaser.count).to eq 3
    end

    it "should normalize and persist all products by name" do
      expect(Product.count).to eq 3
    end

    it "should normalize and persist all merchants by name and address" do
      expect(Merchant.count).to eq 3
    end

    it "should persist each individual purchase with its associated records" do
      expect(Purchase.count).to eq 4
      purchases = Purchase.order("id ASC").all

      expect(purchases[0].price_in_cents).to eq 1000
      expect(purchases[0].count).to eq 2
      expect(purchases[0].purchaser.name).to eq 'Snake Plissken'
      expect(purchases[0].product.name).to eq '$10 off $20 of food'
      expect(purchases[0].merchant.name).to eq "Bob's Pizza"
      expect(purchases[0].merchant.address).to eq '987 Fake St'

      expect(purchases[1].price_in_cents).to eq 1000
      expect(purchases[1].count).to eq 5
      expect(purchases[1].purchaser.name).to eq 'Amy Pond'
      expect(purchases[1].product.name).to eq '$30 of awesome for $10'
      expect(purchases[1].merchant.name).to eq "Tom's Awesome Shop"
      expect(purchases[1].merchant.address).to eq '456 Unreal Rd'

      expect(purchases[2].price_in_cents).to eq 500
      expect(purchases[2].count).to eq 1
      expect(purchases[2].purchaser.name).to eq 'Marty McFly'
      expect(purchases[2].product.name).to eq '$20 Sneakers for $5'
      expect(purchases[2].merchant.name).to eq 'Sneaker Store Emporium'
      expect(purchases[2].merchant.address).to eq '123 Fake St'

      expect(purchases[3].price_in_cents).to eq 500
      expect(purchases[3].count).to eq 4
      expect(purchases[3].purchaser.name).to eq 'Snake Plissken'
      expect(purchases[3].product.name).to eq '$20 Sneakers for $5'
      expect(purchases[3].merchant.name).to eq 'Sneaker Store Emporium'
      expect(purchases[3].merchant.address).to eq '123 Fake St'
    end
  end
end
