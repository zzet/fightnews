# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_profile, :class => 'User::Profile' do
    firstname "MyString"
    lastname "MyString"
    birthdate "2012-11-17 17:17:27"
    country_id 1
    city_id 1
    description "MyString"
  end
end
