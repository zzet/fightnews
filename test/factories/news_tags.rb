# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news_tag, :class => 'News::Tag' do
    news_id 1
    tag_id 1
  end
end
