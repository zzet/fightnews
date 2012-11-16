FactoryGirl.define do
  factory :post_category, :class => 'Post::Category' do
    post
    category
  end
end
