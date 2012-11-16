class Category < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_many :post_categories, dependent: :destroy, class_name: Post::Category
  has_many :posts, through: :post_categories
end
