# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :biography_tag, :class => 'Biography::Tag' do
    biography_id 1
    tag_id 1
  end
end
