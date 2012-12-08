class Legacy::UserRelationship < LegacyDb
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :rid, :requester_id, :requestee_id, :rtid, :approved, :created, :changed, :flags
  validates_presence_of :rid, :requester_id, :requestee_id, :rtid, :approved, :created, :changed, :flags
end

