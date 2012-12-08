class Legacy::ContentTypeBlog < ActiveRecord::Base
  set_table_name  :content_type_blog
  set_primary_key :vid

  # Relationships
  

  # Constraints
  validates_numericality_of :nid
  validates_presence_of :nid
end

