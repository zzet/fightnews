class Legacy::VotingapiAction < ActiveRecord::Base
  set_table_name  :votingapi_action
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_presence_of :parent_name, :aid
end

