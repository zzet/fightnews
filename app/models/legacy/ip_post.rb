class Legacy::IpPost < ActiveRecord::Base
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :id, :ip
  validates_presence_of :type, :id, :ip
end

