class Legacy::PmTag < LegacyDb
  set_primary_key :tag_id

  # Relationships
  

  # Constraints
  validates_numericality_of :public, :hidden, {:allow_nil=>true}
  validates_presence_of :tag
end

