class Article::Category < NewDb
  include UsefullScopes

  attr_accessible :article_id, :category_id

  belongs_to :article
  belongs_to :category

#  validates :article, presence: true
  validates :category, presence: true

end
