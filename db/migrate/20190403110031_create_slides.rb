class CreateSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :slides do |t|
      t.string :url_img
      t.integer :link_slide_id

      t.timestamps
    end
  end
end
