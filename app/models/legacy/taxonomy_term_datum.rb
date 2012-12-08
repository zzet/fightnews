class Legacy::TaxonomyTermDatum < ActiveRecord::Base
  set_primary_key :tid

  # Relationships
  

  # Constraints
  validates_numericality_of :vid, :weight
  validates_presence_of :vid, :weight
end

