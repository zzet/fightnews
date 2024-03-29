class Video::Tag < NewDb
  include UsefullScopes

  attr_accessible :tag_id, :video_id

  belongs_to :video
  belongs_to :tag

  validates :video, presence: true
  validates :tag, presence: true
end
