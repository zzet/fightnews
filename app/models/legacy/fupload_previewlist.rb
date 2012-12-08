class Legacy::FuploadPreviewlist < LegacyDb
  set_table_name  :fupload_previewlist
  set_primary_key :fid

  # Relationships
  

  # Constraints
  validates_numericality_of :uid, :nid, :created
  validates_presence_of :fieldname, :uid, :nid, :created
end

