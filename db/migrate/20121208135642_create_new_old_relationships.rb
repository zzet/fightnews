class CreateNewOldRelationships < ActiveRecord::Migration
  def change
    create_table :new_old_relationships do |t|
      t.integer :new_item_id
      t.integer :old_item_id
      t.string :new_item_type

      t.timestamps
    end
  end
end
