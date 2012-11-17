# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_person, :class => 'User::Person' do
    profile_id 1
    biography_id 1
    position 1
  end
end
