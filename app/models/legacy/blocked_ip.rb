class Legacy::BlockedIp < LegacyDb
  set_primary_key :iid

  # Relationships
  

  # Constraints
  validates_presence_of :ip
end

