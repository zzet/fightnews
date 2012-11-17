class CreateGalleryCategories < ActiveRecord::Migration
  def change
    create_table :gallery_categories do |t|
      t.integer :gallery_id
      t.integer :category_id

      t.timestamps
    end
  end
end
