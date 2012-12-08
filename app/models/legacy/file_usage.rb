class Legacy::FileUsage < ActiveRecord::Base
  set_table_name  :file_usage
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :fid, :id, :count
  validates_presence_of :fid, :module, :type, :id, :count
end

