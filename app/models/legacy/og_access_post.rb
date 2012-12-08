class Legacy::OgAccessPost < ActiveRecord::Base
  set_table_name  :og_access_post
  set_primary_key :nid

  # Relationships
  

  # Constraints
  validates_numericality_of :og_public
  validates_presence_of :og_public
end

