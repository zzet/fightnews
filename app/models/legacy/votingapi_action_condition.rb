class Legacy::VotingapiActionCondition < ActiveRecord::Base
  set_table_name  :votingapi_action_condition
  set_primary_key :name

  # Relationships
  

  # Constraints
  validates_numericality_of :weight
  validates_presence_of :description, :weight, :handler
end

