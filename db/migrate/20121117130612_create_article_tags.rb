class CreateArticleTags < ActiveRecord::Migration
  def change
    create_table :article_tags do |t|
      t.integer :atricle_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
