class Legacy::UrlAlias < ActiveRecord::Base
  set_table_name  :url_alias
  set_primary_key :pid

  # Relationships
  

  # Constraints
  validates_presence_of :source, :alias, :language
end

