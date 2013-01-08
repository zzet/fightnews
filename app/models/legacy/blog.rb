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
    field_data_body.first.body_value if field_data_body && field_data_body.any?
  end

  def description
    field_data_body.first.body_summary if field_data_body && field_data_body.any?
  end

  def image
    url = "http://www.flixya.com/files-photo/t/o/r/torikfauzi-2255501.jpg"
    if field_data_field_image && field_data_field_image.any?
      file = field_data_field_image.first.file_managed
      uri = file.uri
      url = "http://fightnews.ru/files/" << uri[9..-1]
    end
    url
  end

  def source
    source_link = "http://fightnews.ru/"
    source_link = field_data_field_istok.first.field_istok_value if field_data_field_istok.any?
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

