class Legacy::RolePermission < ActiveRecord::Base
  set_table_name  :role_permission
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :rid
  validates_presence_of :rid, :permission, :module
end

