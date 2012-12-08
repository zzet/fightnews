class Legacy::PmIndex < LegacyDb
  set_table_name  :pm_index
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :mid, :thread_id, :recipient, :is_new, :deleted
  validates_presence_of :mid, :thread_id, :recipient, :is_new, :deleted, :type
end

