# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gallery_image, :class => 'Gallery::Image' do
    image "MyString"
    title "MyString"
    description "MyString"
  end
end
