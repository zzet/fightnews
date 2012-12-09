# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :url_alias, :class => 'UrlAliase' do
    source_id 1
    source_type "MyString"
    aliase "MyString"
  end
end
