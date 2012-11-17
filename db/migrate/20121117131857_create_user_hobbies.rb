class CreateUserHobbies < ActiveRecord::Migration
  def change
    create_table :user_hobbies do |t|
      t.integer :profile_id
      t.string :title
      t.string :description
      t.integer :position

      t.timestamps
    end
  end
end
