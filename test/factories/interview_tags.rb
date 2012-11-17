# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interview_tag, :class => 'Interview::Tag' do
    interview_id 1
    tag_id 1
  end
end
