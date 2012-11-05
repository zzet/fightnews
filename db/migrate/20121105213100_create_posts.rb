class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :body
      t.string :photo
      t.integer :autor_id
      t.string :source

      t.timestamps
    end
  end
end
