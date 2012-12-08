class Legacy::BanUser < ActiveRecord::Base
  set_table_name  :ban_user
  set_primary_key :bid

  # Relationships
  belongs_to :user, foreign_key: :uid

  # Constraints
  validates_numericality_of :uid, :deadline, :changed
  validates_presence_of :uid, :deadline, :changed
end

