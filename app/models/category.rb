class Category < NewDb
  attr_accessible :name

  validates :name, presence: true

  has_many :article_categories,   dependent: :destroy, class_name: Article::Category
  has_many :biography_categories, dependent: :destroy, class_name: Biography::Category
  has_many :gallery_categories,   dependent: :destroy, class_name: Gallery::Category
  has_many :interview_categories, dependent: :destroy, class_name: Interview::Category
  has_many :news_categories,      dependent: :destroy, class_name: News::Category
  has_many :post_categories,      dependent: :destroy, class_name: Post::Category
  has_many :video_categories,     dependent: :destroy, class_name: Video::Category

  has_many :articles,     through: :article_categories
  has_many :biographies,  through: :biography_categories
  has_many :galleries,    through: :gallery_categories
  has_many :interviews,   through: :interview_categories
  has_many :news,         through: :news_categories
  has_many :posts,        through: :post_categories
  has_many :videos,       through: :video_categories
end
