class Article::Category < ActiveRecord::Base
  attr_accessible :article_id, :category_id
end
