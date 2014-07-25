FactoryGirl.define do
  sequence :email do |n|
    "somebody#{n}@example.com"
  end

  sequence :title do |n|
    "Title ##{n}"
  end

  sequence :text do
    Faker::Lorem.paragraph
  end
end
