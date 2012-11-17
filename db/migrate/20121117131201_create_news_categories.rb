class CreateNewsCategories < ActiveRecord::Migration
  def change
    create_table :news_categories do |t|
      t.integer :news_id
      t.integer :category_id

      t.timestamps
    end
  end
end
