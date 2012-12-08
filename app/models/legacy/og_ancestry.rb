class Legacy::OgAncestry < ActiveRecord::Base
  set_table_name  :og_ancestry
  set_primary_key :no_primary_key

  # Relationships
  belongs_to :node, foreign_key: :nid, primary_key: :nid
  belongs_to :og, foreign_key: :gid, :primary_key => :group_nid

  # Constraints
  validates_numericality_of :is_public, {:allow_nil=>true}
  validates_numericality_of :nid, :group_nid
  validates_presence_of :nid, :group_nid
end

