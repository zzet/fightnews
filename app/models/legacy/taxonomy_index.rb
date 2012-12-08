class Legacy::TaxonomyIndex < LegacyDb
  set_table_name  :taxonomy_index
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :sticky, {:allow_nil=>true}
  validates_numericality_of :nid, :tid, :created
  validates_presence_of :nid, :tid, :created
end

