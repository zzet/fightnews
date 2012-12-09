class AddFieldToUserViaOldDb < ActiveRecord::Migration
  def change
    add_column :users, :init_email, :string
  end
end
