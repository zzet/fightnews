class Gallery::Tag < ActiveRecord::Base
  attr_accessible :gallery_id, :tag_id

  belongs_to :gallery
  belongs_to :tag

  validates :gallery, presence: true
  validates :tag, presence: true
end
