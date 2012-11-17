class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.string :image
      t.string :title
      t.string :description
      t.integer :gallery_id

      t.timestamps
    end
  end
end
