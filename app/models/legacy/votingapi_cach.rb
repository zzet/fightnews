class Legacy::VotingapiCach < ActiveRecord::Base
  set_table_name  :votingapi_cache
  set_primary_key :vote_cache_id

  # Relationships
  

  # Constraints
  validates_numericality_of :timestamp, {:allow_nil=>true}
  validates_numericality_of :entity_id
  validates_presence_of :entity_id, :value_type
end

