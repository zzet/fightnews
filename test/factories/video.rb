FactoryGirl.define do
  factory :video do
    title
    description
    body
    #photo
    autor
    source        { generate :url }
    hot           { generate :boolean }
  end
end
