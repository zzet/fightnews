class Gallery::Image < ActiveRecord::Base
  attr_accessible :description, :image, :title
end
