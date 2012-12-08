class Legacy::TrollIpBan < ActiveRecord::Base
  set_table_name  :troll_ip_ban
  set_primary_key :iid

  # Relationships
  

  # Constraints
  validates_numericality_of :expires, :created, :uid
  validates_presence_of :ip_address, :domain_name, :expires, :created, :uid
  validates_uniqueness_of :ip_address
end

