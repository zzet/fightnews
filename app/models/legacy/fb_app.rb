class Legacy::FbApp < ActiveRecord::Base
  set_table_name  :fb_app
  set_primary_key :fba_id

  # Relationships
  

  # Constraints
  validates_numericality_of :status, :nid
  validates_presence_of :status, :nid, :label, :apikey, :id, :secret, :canvas, :title
  validates_uniqueness_of :apikey, :label
end

