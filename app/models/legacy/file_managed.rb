class Legacy::FileManaged < ActiveRecord::Base
  set_table_name  :file_managed
  set_primary_key :fid

  # Relationships
  

  # Constraints
  validates_numericality_of :uid, :filesize, :status, :timestamp
  validates_presence_of :uid, :filename, :uri, :filemime, :filesize, :status, :timestamp
  validates_uniqueness_of :uri
end

