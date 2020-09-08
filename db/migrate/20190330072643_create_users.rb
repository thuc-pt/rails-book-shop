class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :phone
      t.string :email
      t.string :address
      t.date :birthday
      t.boolean :gender
      t.integer :account_id

      t.timestamps
    end
  end
end
