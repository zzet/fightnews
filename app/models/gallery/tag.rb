class Gallery::Tag < ActiveRecord::Base
  attr_accessible :gallery_id, :tag_id
end
