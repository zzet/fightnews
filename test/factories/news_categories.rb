# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news_category, :class => 'News::Category' do
    news_id 1
    category_id 1
  end
end
