class Legacy::IpRange < LegacyDb
  set_primary_key :bid

  # Relationships
  

  # Constraints
  validates_presence_of :ip, :type
end

