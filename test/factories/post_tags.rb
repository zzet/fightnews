FactoryGirl.define do
  factory :post_tag, :class => 'Post::Tag' do
    post
    tag
  end
end
