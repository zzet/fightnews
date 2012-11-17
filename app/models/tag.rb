class Tag < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_many :article_tags,   dependent: :destroy, class_name: Article::Tag
  has_many :biography_tags, dependent: :destroy, class_name: Biography::Tag
  has_many :gallery_tags,   dependent: :destroy, class_name: Gallery::Tag
  has_many :interview_tags, dependent: :destroy, class_name: Interview::Tag
  has_many :news_tags,      dependent: :destroy, class_name: News::Tag
  has_many :post_tags,      dependent: :destroy, class_name: Post::Tag
  has_many :video_tags,     dependent: :destroy, class_name: Video::Tag

  has_many :articles,       through: :article_tags
  has_many :biographies,    through: :biography_tags
  has_many :galleries,      through: :gallery_tags
  has_many :interviews,     through: :interview_tags
  has_many :news,           through: :news_tags
  has_many :posts,          through: :post_tags
  has_many :videos,         through: :video_tags
end
