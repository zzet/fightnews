class Legacy::Nodeword < ActiveRecord::Base
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_presence_of :type, :id, :name
end

