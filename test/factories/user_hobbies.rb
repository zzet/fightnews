# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_hobby, :class => 'User::Hobby' do
    profile_id 1
    title "MyString"
    description "MyString"
    position 1
  end
end
