# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interview_category, :class => 'Interview::Category' do
    interview_id 1
    category_id 1
  end
end
