# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: 'user@example.com',
  password: 'password'
)

User.create(
  email: 'admin@example.com',
  password: 'password'
)

# Create posts and attached comments
4.times do
  post = Post.create(
    title: Faker::Lorem.sentence,
    subtitle: Faker::Lorem.sentence,
    text: Faker::Lorem.paragraph
  )
  3.times do
    post.comments.create(
      commenter: Faker::Internet.email,
      body: Faker::Lorem.sentence
    )
  end
end
