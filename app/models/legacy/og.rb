class Legacy::Og < ActiveRecord::Base
  set_table_name  :og
  set_primary_key :nid

  # Relationships
  belongs_to :node, foreign_key: :nid, primary_key: :nid

  # Constraints
  validates_numericality_of :og_selective, :og_register, :og_directory, :notification, :og_private
  validates_presence_of :og_selective, :og_register, :og_directory, :notification, :og_language, :og_private
end

