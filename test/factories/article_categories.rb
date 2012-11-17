# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article_category, :class => 'Article::Category' do
    article_id 1
    category_id 1
  end
end
