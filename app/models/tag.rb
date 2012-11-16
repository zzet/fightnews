class Tag < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_many :post_tags, dependent: :destroy, class_name: Post::Tag
  has_many :posts, through: :post_tags
end
