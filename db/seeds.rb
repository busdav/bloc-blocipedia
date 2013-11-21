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
    title: Faker::Lorem.words(rand(1..1)).join(" "), 
    body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"))
  end
end



  u = User.new(
    name: 'Robert Ing',
    email: 'free@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld')
  u.skip_confirmation!
  u.save
  u.update_attributes(role: 'free')

  u = User.new(
    name: 'Robert Ing',
    email: 'premium@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld')
  u.skip_confirmation!  
  u.save
  u.update_attributes(role: 'premium')


puts "seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"