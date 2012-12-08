class Legacy::FieldDataBody < ActiveRecord::Base
  set_table_name  :field_data_body
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :revision_id, {:allow_nil=>true}
  validates_numericality_of :deleted, :entity_id, :delta
  validates_presence_of :entity_type, :bundle, :deleted, :entity_id, :language, :delta
end

