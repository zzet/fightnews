FactoryGirl.define do
  factory :article do
    title
    description
    body
    #photo
    autor
    source        { generate :url }
    hot           { generate :boolean }
  end
end
