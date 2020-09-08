class CreateLinkSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :link_slides do |t|
      t.string :name

      t.timestamps
    end
  end
end
