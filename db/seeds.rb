# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

john = User.create(
  email: 'john@example.com',
  password: 'password'
)

jane = User.create(
  email: 'jane@example.com',
  password: 'password'
)

# Create posts and attached comments
[john, jane].each do |user|
  20.times do
    post = user.posts.create(
      title: Faker::Lorem.sentence,
      subtitle: Faker::Lorem.sentence,
      text: Faker::Lorem.paragraph,
      created_at: Faker::Time.between(10.days.ago, Date.today, :all)
    )
    3.times do
      post.comments.create(
        body: Faker::Lorem.sentence,
        user: [john, jane].sample
      )
    end
  end
end
