class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :description
      t.string :body
      t.string :photo
      t.integer :autor_id
      t.string :source
      t.string :type
      t.string :state
      t.boolean :hot

      t.timestamps
    end
  end
end
