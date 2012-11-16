FactoryGirl.define do
  factory :news do
    title
    description
    body
    #photo
    autor
    source        { generate :url }
    hot           { generate :boolean }
  end
end
