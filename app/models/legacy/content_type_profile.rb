class Legacy::ContentTypeProfile < ActiveRecord::Base
  set_table_name  :content_type_profile
  set_primary_key :vid

  # Relationships
  

  # Constraints
  validates_numericality_of :field_my_photo_fid, :field_my_photo_list, :field_about_me_format, {:allow_nil=>true}
  validates_numericality_of :nid
  validates_presence_of :nid
end

