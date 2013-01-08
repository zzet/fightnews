class AddAvatarFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :state, :string
  end
end
