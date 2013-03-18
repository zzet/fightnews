class News::Tag < NewDb
  include UsefullScopes

  attr_accessible :news_id, :tag_id

  belongs_to :news
  belongs_to :tag

  validates :news, presence: true
  validates :tag, presence: true
end
