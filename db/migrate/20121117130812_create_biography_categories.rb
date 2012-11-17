class CreateBiographyCategories < ActiveRecord::Migration
  def change
    create_table :biography_categories do |t|
      t.integer :biography_id
      t.integer :category_id

      t.timestamps
    end
  end
end
