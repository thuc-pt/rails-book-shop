class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :url_img
      t.string :title
      t.string :author
      t.integer :price
      t.text :detail
      t.date :publishing_date
      t.integer :weight
      t.string :size
      t.integer :number_page
      t.string :sku
      t.integer :category_id
      t.integer :supplier_id
      t.integer :company_id
      t.integer :formality_id
      t.integer :language_id

      t.timestamps
    end
  end
end
