class News::Category < ActiveRecord::Base
  attr_accessible :category_id, :news_id

  belongs_to :news
  belongs_to :category

  validates :news, presence: true
  validates :category, presence: true
end