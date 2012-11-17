# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :biography_category, :class => 'Biography::Category' do
    biography_id 1
    category_id 1
  end
end
