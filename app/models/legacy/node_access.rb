class Legacy::NodeAccess < ActiveRecord::Base
  set_table_name  :node_access
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  def self.possible_values_for_grant_update
    ["true", "false"]
  end
  validates_inclusion_of :grant_update,
                         :in      => possible_values_for_grant_update, 
                         :message => "is not one of (#{possible_values_for_grant_update.join(', ')})"

  def self.possible_values_for_grant_delete
    ["true", "false"]
  end
  validates_inclusion_of :grant_delete,
                         :in      => possible_values_for_grant_delete, 
                         :message => "is not one of (#{possible_values_for_grant_delete.join(', ')})"

  validates_numericality_of :nid, :gid, :grant_view
  validates_presence_of :nid, :gid, :realm, :grant_view
end

