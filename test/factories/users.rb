FactoryGirl.define do
  factory :user, aliases: [:autor] do
    email
    password
    remember_me { generate :boolean }
    nickname { generate :name }
    #provider
    url
    username { generate :name }
  end
end
