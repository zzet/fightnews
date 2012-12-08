class Legacy::ContentFieldFotogal < ActiveRecord::Base
  set_table_name  :content_field_fotogal
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :field_fotogal_fid, :field_fotogal_list, {:allow_nil=>true}
  validates_numericality_of :vid, :nid, :delta
  validates_presence_of :vid, :nid, :delta
end

