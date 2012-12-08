class Legacy::OgUid < LegacyDb
  set_table_name  :og_uid
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :mail_type, :created, :changed, {:allow_nil=>true}
  validates_numericality_of :nid, :og_role, :is_active, :is_admin, :uid
  validates_presence_of :nid, :og_role, :is_active, :is_admin, :uid
end

