class Article::Tag < NewDb
  include UsefullScopes

  attr_accessible :atricle_id, :tag_id

  belongs_to :article
  belongs_to :tag

#  validates :article, presence: true
  validates :tag, presence: true

end
