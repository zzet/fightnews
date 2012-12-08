class Legacy::PmMessage < LegacyDb
  set_table_name  :pm_message
  set_primary_key :mid

  # Relationships
  

  # Constraints
  validates_numericality_of :author, :timestamp, :has_tokens
  validates_presence_of :author, :subject, :body, :timestamp, :has_tokens
end

