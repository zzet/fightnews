class Legacy::UserRelationshipsUiSetting < LegacyDb
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :rtid, :hide, :show_tab
  validates_presence_of :rtid, :hide, :show_tab
  validates_uniqueness_of :rtid
end

