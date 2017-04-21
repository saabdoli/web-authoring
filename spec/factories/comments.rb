require 'faker'

FactoryGirl.define do
  factory :comment do |f|
    f.commenter { Faker::Internet.email }
    f.body { Faker::Lorem.paragraph }
    f.article
  end
end
