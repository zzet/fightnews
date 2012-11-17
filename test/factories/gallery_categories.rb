# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gallery_category, :class => 'Gallery::Category' do
    gallery_id 1
    category_id 1
  end
end
