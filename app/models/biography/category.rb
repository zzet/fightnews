class Biography::Category < NewDb
  attr_accessible :biography_id, :category_id

  belongs_to :biography
  belongs_to :category

  validates :biography, presence: true
  validates :category, presence: true
end
