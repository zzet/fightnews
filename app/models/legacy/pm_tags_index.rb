class Legacy::PmTagsIndex < LegacyDb
  set_table_name  :pm_tags_index
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :tag_id, :uid, :thread_id
  validates_presence_of :tag_id, :uid, :thread_id
end

