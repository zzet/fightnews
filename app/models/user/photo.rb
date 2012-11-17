class User::Photo < ActiveRecord::Base
  attr_accessible :description, :image, :profile_id, :title
end
