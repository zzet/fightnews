class CreateUserPhotos < ActiveRecord::Migration
  def change
    create_table :user_photos do |t|
      t.integer :profile_id
      t.string :image
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
