class Legacy::PmBlockUser < LegacyDb
  set_table_name  :pm_block_user
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :author, :recipient
  validates_presence_of :author, :recipient
end

