class Legacy::Usernode < LegacyDb
  set_table_name  :usernode
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :nid, :uid
  validates_presence_of :nid, :uid
end

