class Legacy::FieldDataUpload < ActiveRecord::Base
  set_table_name  :field_data_upload
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :revision_id, :upload_fid, {:allow_nil=>true}
  validates_numericality_of :deleted, :entity_id, :delta, :upload_display
  validates_presence_of :entity_type, :bundle, :deleted, :entity_id, :language, :delta, :upload_display
end

