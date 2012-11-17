class CreateUserPeople < ActiveRecord::Migration
  def change
    create_table :user_people do |t|
      t.integer :profile_id
      t.integer :biography_id
      t.integer :position

      t.timestamps
    end
  end
end
