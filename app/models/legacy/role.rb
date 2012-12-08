class Legacy::Role < ActiveRecord::Base
  set_table_name  :role
  set_primary_key :rid

  # Relationships
  has_many :users_role, foreign_key: :rid

  # Constraints
  validates_numericality_of :weight
  validates_presence_of :name, :weight
  validates_uniqueness_of :name
end

