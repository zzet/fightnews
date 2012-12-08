class Legacy::Poll < ActiveRecord::Base
  set_table_name  :poll
  set_primary_key :nid

  # Relationships
  has_many :poll_choice, foreign_key: :nid
  has_many :poll_vote, foreign_key: :nid

  # Constraints
  validates_numericality_of :runtime, :active
  validates_presence_of :runtime, :active

  def choises
    values = []
    poll_choice.each do |c|
      values << c
    end
    values
  end

  def votes
    values = []
    poll_vote.each do |v|
      values << v
    end
    values
  end
end

