require 'faker'

rand(5..10).times do
  password = Faker::Lorem.characters(10)
  u = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password)
  u.skip_confirmation!
  u.save

  rand(10..30).times do 
  w = u.wikis.create(
    title: Faker::Lorem.words(rand(1..10)).join(" "), 
    body: Faker::Lorem.paragraphs(rand(1..3)).join("\n"))
  end
end

  u = User.first
  u.skip_confirmation!
  u.update_attributes(email: 'example@example.com', password: 'helloworld', password_confirmation: 'helloworld')

puts "seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"