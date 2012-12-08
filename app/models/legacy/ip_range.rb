class Legacy::IpRange < ActiveRecord::Base
  set_primary_key :bid

  # Relationships
  

  # Constraints
  validates_presence_of :ip, :type
end

