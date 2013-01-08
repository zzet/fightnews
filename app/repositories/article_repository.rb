module ArticleRepository
  extend ActiveSupport::Concern

  included do
    scope :published, where(state: :published)
    scope :web, published
    scope :hot, where(hot: true)
  end
end
