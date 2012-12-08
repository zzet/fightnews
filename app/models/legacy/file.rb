class Legacy::File < LegacyDb
  set_primary_key :fid

  # Relationships
  

  # Constraints
  validates_numericality_of :uid, :filesize, :status, :timestamp
  validates_presence_of :uid, :filename, :filepath, :filemime, :filesize, :status, :timestamp
end

