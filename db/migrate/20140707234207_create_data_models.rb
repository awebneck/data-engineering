class CreateDataModels < ActiveRecord::Migration
  def change
    create_table :purchasers do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :purchasers, :name

    create_table :merchants do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.timestamps
    end

    add_index :merchants, :name

    create_table :products do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :products, :name

    create_table :purchases do |t|
      t.integer :purchaser_id, null: false
      t.integer :product_id, null: false
      t.integer :merchant_id, null: false
      t.integer :count, null: false
      t.integer :price_in_cents, null: false
      t.timestamps
    end

    add_index :purchases, :purchaser_id
    add_index :purchases, :merchant_id
    add_index :purchases, :product_id
  end
end
