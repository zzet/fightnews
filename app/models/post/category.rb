class Post::Category < ActiveRecord::Base
  attr_accessible :category_id, :post_id

  belongs_to :post
  belongs_to :category

  validates :post, presence: true
  validates :category, presence: true
end
