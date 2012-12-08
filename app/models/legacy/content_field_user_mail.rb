class ContentFieldUserMail < ActiveRecord::Base
  set_table_name  :content_field_user_mail
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :vid, :nid, :delta
  validates_presence_of :vid, :nid, :delta
end

