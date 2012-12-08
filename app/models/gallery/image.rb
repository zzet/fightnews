class Gallery::Image < NewDb
  attr_accessible :description, :image, :title, :gallery_id

  belongs_to :gallery

  validates :image, presence: true
  validates :gallery, presence: true

  mount_uploader :image, PhotoUploader
end
