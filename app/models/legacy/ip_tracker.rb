class Legacy::IpTracker < LegacyDb
  set_table_name  :ip_tracker
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :uid, :ip, :visits, :first_visit, :last_visit
  validates_presence_of :uid, :ip, :visits, :first_visit, :last_visit
end

