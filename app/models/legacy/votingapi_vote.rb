class Legacy::VotingapiVote < ActiveRecord::Base
  set_table_name  :votingapi_vote
  set_primary_key :vote_id

  # Relationships
  

  # Constraints
  validates_numericality_of :uid, :timestamp, {:allow_nil=>true}
  validates_numericality_of :entity_id
  validates_presence_of :entity_id, :value_type, :currentuservoted
end

