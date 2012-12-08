class Legacy::PollVote < ActiveRecord::Base
  set_table_name  :poll_vote
  set_primary_key :no_primary_key

  # Relationships
  belongs_to :user, foreign_key: :uid
  belongs_to :poll, foreign_key: :nid
  belongs_to :poll_choise, foreign_key: :chid

  # Constraints
  validates_numericality_of :nid, :uid, :chid, :timestamp
  validates_presence_of :nid, :uid, :hostname, :chid, :timestamp
end

