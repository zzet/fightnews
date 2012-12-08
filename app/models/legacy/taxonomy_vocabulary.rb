class Legacy::TaxonomyVocabulary < ActiveRecord::Base
  set_table_name  :taxonomy_vocabulary
  set_primary_key :vid

  # Relationships
  

  # Constraints
  validates_numericality_of :hierarchy, :weight
  validates_presence_of :name, :hierarchy, :module, :weight, :machine_name
  validates_uniqueness_of :machine_name
end

