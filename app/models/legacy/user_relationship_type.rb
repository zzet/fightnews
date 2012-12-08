class Legacy::UserRelationshipType < LegacyDb
  set_primary_key :rtid

  # Relationships
  

  # Constraints
  validates_numericality_of :is_oneway, :is_reciprocal, :requires_approval, :expires_val
  validates_presence_of :name, :plural_name, :is_oneway, :is_reciprocal, :requires_approval, :expires_val
  validates_uniqueness_of :name
end

