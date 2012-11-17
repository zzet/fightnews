# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_photo, :class => 'User::Photo' do
    profile_id 1
    image "MyString"
    title "MyString"
    description "MyString"
  end
end
