class Legacy::Interest < ActiveRecord::Base
  set_primary_key :no_primary_key

  # Relationships
  belongs_to :user, foreign_key: :uid
  belongs_to :taxonomy_term_datum, foreign_key: :tid

  # Constraints
  validates_numericality_of :uid, :tid, :counter
  validates_presence_of :uid, :tid, :counter
end

