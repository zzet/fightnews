class Gallery::Category < NewDb
  include UsefullScopes

  attr_accessible :category_id, :gallery_id

  belongs_to :gallery
  belongs_to :category

  validates :gallery, presence: true
  validates :category, presence: true
end
