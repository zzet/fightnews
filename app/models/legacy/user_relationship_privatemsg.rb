class Legacy::UserRelationshipPrivatemsg < LegacyDb
  set_table_name  :user_relationship_privatemsg
  set_primary_key :urpid

  # Relationships
  

  # Constraints
  #validates_uniqueness_of_multiple_column_constraint ["rtid", "author"]
  validates_numericality_of :rtid, :author
  validates_presence_of :rtid, :author
end

