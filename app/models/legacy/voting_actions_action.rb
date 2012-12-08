class Legacy::VotingActionsAction < LegacyDb
  set_table_name  :voting_actions_action
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_presence_of :vasid, :aid
end

