class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :bookstore_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
