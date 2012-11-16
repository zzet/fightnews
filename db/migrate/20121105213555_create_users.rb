class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :nickname
      t.string :provider
      t.string :url
      t.string :email
      t.string :remember_me
      t.string :password

      t.timestamps
    end
  end
end
