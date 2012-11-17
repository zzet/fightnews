# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video_category, :class => 'Video::Category' do
    video_id 1
    category_id 1
  end
end
