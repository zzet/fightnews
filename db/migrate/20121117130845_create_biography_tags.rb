class CreateBiographyTags < ActiveRecord::Migration
  def change
    create_table :biography_tags do |t|
      t.integer :biography_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
