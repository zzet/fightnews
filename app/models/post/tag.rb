class Post::Tag < ActiveRecord::Base
  attr_accessible :post_id, :tag_id

  belongs_to :post
  belongs_to :tag

  validates :post, presence: true
  validates :tag, presence: true
end
