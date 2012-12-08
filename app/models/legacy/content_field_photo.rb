class Legacy::ContentFieldPhoto < LegacyDb
  set_table_name  :content_field_photo
  set_primary_key :vid

  # Relationships
  

  # Constraints
  validates_numericality_of :field_photo_fid, :field_photo_list, {:allow_nil=>true}
  validates_numericality_of :nid
  validates_presence_of :nid
end

