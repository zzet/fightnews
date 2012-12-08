class Legacy::ContentTypeOgGroup < LegacyDb
  set_table_name  :content_type_og_group
  set_primary_key :vid

  # Relationships
  

  # Constraints
  validates_numericality_of :field_ogimage_fid, :field_ogimage_list, {:allow_nil=>true}
  validates_numericality_of :nid
  validates_presence_of :nid
end

