class Legacy::Node < ActiveRecord::Base
  set_table_name  :node
  set_primary_key :nid

  # Relationships
  has_many :content_field_istok, :foreign_key => :nid
  has_many :comment, foreign_key: :nid

  # Constraints
  validates_numericality_of :vid, :uid, :status, :created, :changed, :comment, :promote, :sticky, :tnid, :translate
  validates_presence_of :vid, :type, :title, :uid, :status, :created, :changed, :comment, :promote, :sticky, :language, :tnid, :translate
end

