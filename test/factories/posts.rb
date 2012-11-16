FactoryGirl.define do
  factory :post do
    title
    description
    body
    #photo
    autor
    source        { generate :url }
    hot           { generate :boolean }
  end
end
