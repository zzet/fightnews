class CreateInterviewTags < ActiveRecord::Migration
  def change
    create_table :interview_tags do |t|
      t.integer :interview_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
