class Legacy::ProfileType < LegacyDb
  set_table_name  :profile_type

  # Relationships
  

  # Constraints
  validates_numericality_of :weight, :status
  validates_presence_of :type, :label, :weight, :status
  validates_uniqueness_of :type
end

