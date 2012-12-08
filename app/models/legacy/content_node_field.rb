class Legacy::ContentNodeField < LegacyDb
  set_table_name  :content_node_field
  set_primary_key :field_name

  # Relationships
  

  # Constraints
  validates_numericality_of :required, :multiple, :db_storage, :active, :locked
  validates_presence_of :type, :global_settings, :required, :multiple, :db_storage, :module, :db_columns, :active, :locked
end

