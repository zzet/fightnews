class News::Tag < ActiveRecord::Base
  attr_accessible :news_id, :tag_id

  belongs_to :news
  belongs_to :tag

  validates :news, presence: true
  validates :tag, presence: true
end
