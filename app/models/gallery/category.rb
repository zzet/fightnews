class Gallery::Category < ActiveRecord::Base
  attr_accessible :category_id, :gallery_id

  belongs_to :gallery
  belongs_to :category

  validates :gallery, presence: true
  validates :category, presence: true
end
