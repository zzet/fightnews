class Legacy::Blog < LegacyDb
  set_table_name  :node
  set_primary_key :nid

  # Relationships
  has_many :field_data_field_istok, :foreign_key => :entity_id
  has_many :field_data_body, :foreign_key => :entity_id
  has_many :field_data_taxonomy_vocabulary_1, :foreign_key => :entity_id
  has_many :field_data_taxonomy_vocabulary_2, :foreign_key => :entity_id
  has_many :field_data_field_image, :foreign_key => :entity_id
  has_many :comment, foreign_key: :nid

  # Constraints
  validates_numericality_of :vid, :uid, :status, :created, :changed, :comment, :promote, :sticky, :tnid, :translate
  validates_presence_of :vid, :type, :title, :uid, :status, :created, :changed, :comment, :promote, :sticky, :language, :tnid, :translate

  scope :actual, where(sti: "blog")

  def body
    field_data_body.first.body_value
  end

  def description
    field_data_body.first.body_summary
  end

  def image
    field_data_field_image.first.file_managed
  end

  def source
    field_data_field_istok.first.field_istok_value
  end

  def tags
    values = []
    field_data_taxonomy_vocabulary_2.each do |t|
      values << t.taxonomy_term_datum
    end
    values
  end

  def categories
    values = []
    field_data_taxonomy_vocabulary_1.each do |t|
      values << t.taxonomy_term_datum
    end
    values
  end

  def autor
    User.find_by_uid(uid)
  end
end

