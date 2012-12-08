class Legacy::FalseAccount < LegacyDb
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :uid, :created, :status
  validates_presence_of :cid, :uid, :created, :status
end

