# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

raise 'No destroying the production databaseplease!' if Rails.env.production?

puts "Emptying DB"

Office.destroy_all
User.destroy_all

user1 = User.create!(email: 'bob@airwork.com', password: 'password', avatar: 'https://kitt.lewagon.com/placeholder/users/arthur-littm')
user2 = User.create!(email: 'john@airwork.com', password: 'password', avatar: 'https://kitt.lewagon.com/placeholder/users/sarahlafer')
user3 = User.create!(email: 'paul@airwork.com', password: 'password', avatar: 'https://kitt.lewagon.com/placeholder/users/cveneziani')


5.times do |i|
  url = 'https://res.cloudinary.com/dlo5xbrsn/image/upload/v1575990023/Air-work/andrew-neel-QLqNalPe0RA-unsplash_rtkomr.jpg'

  office = Office.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    description: Faker::Restaurant.name,
    user: user1,
    photo: url
  )

  office.save!
  puts "#{office.name} created!"
end

5.times do |i|
  url = 'https://res.cloudinary.com/dlo5xbrsn/image/upload/v1575990023/Air-work/jonathan-borba-v-JzyJAxcj0-unsplash_ovamna.jpg'

  office = Office.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    description: Faker::Restaurant.name,
    user: user2,
    photo: url
  )

  office.save!
  puts "#{office.name} created!"
end

5.times do |i|
  url = 'https://res.cloudinary.com/dlo5xbrsn/image/upload/v1575990022/Air-work/roberto-nickson-LKGwdezdqSk-unsplash_uyodqr.jpg'

  office = Office.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    description: Faker::Restaurant.name,
    user: user3,
    photo: url
  )

  office.save!
  puts "#{office.name} created!"
end
