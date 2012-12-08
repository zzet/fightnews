class Legacy::OgUidGlobal < LegacyDb
  set_table_name  :og_uid_global
  set_primary_key :uid

  # Relationships
  

  # Constraints
  validates_numericality_of :og_email
  validates_presence_of :og_email
end

