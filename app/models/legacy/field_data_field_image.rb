class Legacy::FieldDataFieldImage < LegacyDb
  set_table_name  :field_data_field_image
  set_primary_key :no_primary_key

  # Relationships
  belongs_to :file_managed, foreign_key: :field_image_fid

  # Constraints
  validates_numericality_of :revision_id, :field_image_fid, :field_image_width, :field_image_height, {:allow_nil=>true}
  validates_numericality_of :deleted, :entity_id, :delta
  validates_presence_of :entity_type, :bundle, :deleted, :entity_id, :language, :delta
end

