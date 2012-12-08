class Legacy::VotingActionsSet < LegacyDb
  set_table_name  :voting_actions_set
  set_primary_key :vasid

  # Relationships
  

  # Constraints
  validates_numericality_of :parent, :required, :weight
  validates_presence_of :parent, :name, :required, :weight
end

