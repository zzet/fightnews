class Legacy::VotingActionsCondition < LegacyDb
  set_table_name  :voting_actions_condition
  set_primary_key :vacid

  # Relationships
  

  # Constraints
  validates_numericality_of :vasid, :weight
  validates_presence_of :vasid, :name, :weight
end

