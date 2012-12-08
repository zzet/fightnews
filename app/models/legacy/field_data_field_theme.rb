class Legacy::FieldDataFieldTheme < LegacyDb
  set_table_name  :field_data_field_theme
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :revision_id, :field_theme_tid, {:allow_nil=>true}
  validates_numericality_of :deleted, :entity_id, :delta
  validates_presence_of :entity_type, :bundle, :deleted, :entity_id, :language, :delta
end

