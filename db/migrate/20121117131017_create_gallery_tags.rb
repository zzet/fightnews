class CreateGalleryTags < ActiveRecord::Migration
  def change
    create_table :gallery_tags do |t|
      t.integer :gallery_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
