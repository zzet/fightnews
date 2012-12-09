# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :new_old_relationship do
    new_item_id 1
    old_item_id 1
    new_item_type "MyString"
  end
end
