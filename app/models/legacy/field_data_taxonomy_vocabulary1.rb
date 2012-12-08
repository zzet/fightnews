class Legacy::FieldDataTaxonomyVocabulary1 < ActiveRecord::Base
  set_table_name  :field_data_taxonomy_vocabulary_1
  set_primary_key :no_primary_key

  # Relationships
  belongs_to :taxonomy_term_datum, foreign_key: :taxonomy_vocabulary_1_tid

  # Constraints
  validates_numericality_of :revision_id, :taxonomy_vocabulary_1_tid, {:allow_nil=>true}
  validates_numericality_of :deleted, :entity_id, :delta
  validates_presence_of :entity_type, :bundle, :deleted, :entity_id, :language, :delta
end

