class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :firstname
      t.string :lastname
      t.datetime :birthdate
      t.integer :country_id
      t.integer :city_id
      t.string :description

      t.timestamps
    end
  end
end
