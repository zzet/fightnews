class Gallery::Tag < NewDb
  include UsefullScopes

  attr_accessible :gallery_id, :tag_id

  belongs_to :gallery
  belongs_to :tag

  validates :gallery, presence: true
  validates :tag, presence: true
end
