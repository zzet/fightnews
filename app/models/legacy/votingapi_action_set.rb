class Legacy::VotingapiActionSet < ActiveRecord::Base
  set_table_name  :votingapi_action_set
  set_primary_key :name

  # Relationships
  

  # Constraints
  validates_numericality_of :required, :weight
  validates_presence_of :required, :weight
end

