class CreateBookstores < ActiveRecord::Migration[5.2]
  def change
    create_table :bookstores do |t|
      t.integer :book_id
      t.integer :quantity
      t.integer :sold
      t.integer :remain
      t.boolean :highlight
      t.integer :sale
      t.integer :price_sale

      t.timestamps
    end
  end
end
