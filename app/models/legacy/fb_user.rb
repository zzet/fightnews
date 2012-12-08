class Legacy::FbUser < ActiveRecord::Base
  set_table_name  :fb_user
  set_primary_key :uid

  # Relationships
  has_one :user, foreign_key: :uid

  # Constraints
  validates_numericality_of :fbu
  validates_presence_of :fbu
  validates_uniqueness_of :fbu
end

