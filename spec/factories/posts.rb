require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.title { Faker::Lorem.sentence }
    f.subtitle { Faker::Lorem.sentence }
    f.text { Faker::Lorem.paragraph(4) }
  end
end
