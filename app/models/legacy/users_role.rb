class Legacy::UsersRole < ActiveRecord::Base
  set_primary_key :no_primary_key

  # Relationships
  belongs_to :role, foreign_key: :rid
  belongs_to :user, foreign_key: :uid

  # Constraints
  validates_numericality_of :uid, :rid
  validates_presence_of :uid, :rid
end

