class Legacy::TrollIpTrack < ActiveRecord::Base
  set_table_name  :troll_ip_track
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :uid, :accessed, :created
  validates_presence_of :uid, :accessed, :ip_address, :created
end

