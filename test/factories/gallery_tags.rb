# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gallery_tag, :class => 'Gallery::Tag' do
    gallery_id 1
    tag_id 1
  end
end
