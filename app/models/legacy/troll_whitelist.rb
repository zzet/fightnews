class Legacy::TrollWhitelist < LegacyDb
  set_table_name  :troll_whitelist
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  #validates_uniqueness_of_multiple_column_constraint ["net", "bcast"]
  validates_numericality_of :net, :bcast
  validates_presence_of :net, :bcast
end

