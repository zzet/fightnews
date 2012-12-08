class Legacy::ContentFieldIstok < ActiveRecord::Base
  set_table_name  :content_field_istok
  set_primary_key :vid

  # Relationships
  

  # Constraints
  validates_numericality_of :field_istok_format, {:allow_nil=>true}
  validates_numericality_of :nid
  validates_presence_of :nid
end

