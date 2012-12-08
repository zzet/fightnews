class Legacy::PollChoice < LegacyDb
  set_table_name  :poll_choice
  set_primary_key :chid

  # Relationships
  

  # Constraints
  validates_numericality_of :nid, :chvotes, :weight
  validates_presence_of :nid, :chtext, :chvotes, :weight
end

