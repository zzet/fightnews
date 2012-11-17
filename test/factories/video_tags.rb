# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video_tag, :class => 'Video::Tag' do
    video_id 1
    tag_id 1
  end
end
