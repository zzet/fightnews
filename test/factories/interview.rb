FactoryGirl.define do
  factory :interview do
    title
    description
    body
    #photo
    autor
    source        { generate :url }
    hot           { generate :boolean }
  end
end
