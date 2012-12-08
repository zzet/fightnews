class Legacy::Profile < ActiveRecord::Base
  set_table_name  :profile
  set_primary_key :pid

  # Relationships
  has_many :comment, foreign_key: :nid
  belongs_to :user, foreign_key: :uid

  # Constraints
  validates_numericality_of :uid, {:allow_nil=>true}
  validates_presence_of :type
end

