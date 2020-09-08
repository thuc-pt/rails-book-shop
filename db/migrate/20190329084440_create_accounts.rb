class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :hash_password
      t.string :salt

      t.timestamps
    end
  end
end
