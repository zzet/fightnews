# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article_tag, :class => 'Article::Tag' do
    atricle_id 1
    tag_id 1
  end
end
