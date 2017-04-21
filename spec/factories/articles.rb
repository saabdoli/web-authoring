require 'faker'

FactoryGirl.define do
  factory :article do |f|
    f.title { Faker::Lorem.sentence }
    f.subtitle { Faker::Lorem.sentence }
    f.text { Faker::Lorem.paragraph(4) }
  end
end
