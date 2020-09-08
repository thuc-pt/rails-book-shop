class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.integer :account_id
      t.integer :bookstore_id
      t.integer :start
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
