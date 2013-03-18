class Biography::Category < NewDb
  include UsefullScopes

  attr_accessible :biography_id, :category_id

  belongs_to :biography
  belongs_to :category

  validates :biography, presence: true
  validates :category, presence: true
end
