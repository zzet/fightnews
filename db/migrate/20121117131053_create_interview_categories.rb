class CreateInterviewCategories < ActiveRecord::Migration
  def change
    create_table :interview_categories do |t|
      t.integer :interview_id
      t.integer :category_id

      t.timestamps
    end
  end
end
