class CreateUrlAliases < ActiveRecord::Migration
  def change
    create_table :url_aliases do |t|
      t.integer :source_id
      t.string :source_type
      t.string :aliase

      t.timestamps
    end
  end
end
