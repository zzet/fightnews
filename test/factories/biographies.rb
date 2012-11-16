# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :biography do
    title
    description
    body
    #photo
    autor
    source        { generate :url }
    hot           { generate :boolean }
  end
end
