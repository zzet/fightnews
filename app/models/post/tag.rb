class Post::Tag < NewDb
  include UsefullScopes

  attr_accessible :post_id, :tag_id

  belongs_to :post
  belongs_to :tag

  validates :post, presence: true
  validates :tag, presence: true
end
