class Video::Category < NewDb
  attr_accessible :category_id, :video_id

  belongs_to :video
  belongs_to :category

  validates :video, presence: true
  validates :category, presence: true
end
