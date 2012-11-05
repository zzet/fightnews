class Post < ActiveRecord::Base
  attr_accessible :autor_id, :body, :description, :photo, :source, :title
end
