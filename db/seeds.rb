# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#raise 'No destroying the production databaseplease!' if Rails.env.production?

puts "Emptying DB"

Booking.destroy_all
Office.destroy_all
User.destroy_all

user1 = User.create!(first_name: 'Bob', last_name: 'Marlyn', email: 'bob@airwork.com', password: 'password', avatar: 'https://kitt.lewagon.com/placeholder/users/arthur-littm')
user2 = User.create!(first_name: 'John', last_name: 'Scott', email: 'john@airwork.com', password: 'password', avatar: 'https://kitt.lewagon.com/placeholder/users/sarahlafer')
user3 = User.create!(first_name: 'Paul', last_name: 'Smith', email: 'paul@airwork.com', password: 'password', avatar: 'https://kitt.lewagon.com/placeholder/users/cveneziani')


office1 = Office.new(
    name: 'Spacious living room',
    address: "Carrer de Ca N'Oliva, 54, 08020 Barcelona",
    description: 'Nice place for small and big groups',
    price: 15,
    user: user1,
    remote_photo_url: 'https://www.washingtonian.com/wp-content/uploads/2019/11/Copy-of-Bethesda_001-1-1500x1000.jpg'
  )
Booking.create(office: office1, user: user2, status: 'closed')
office1.save!
puts "#{office1.name} created!"


office2 = Office.new(
    name: 'Cozy working space',
    address: "Carrer del Rec, 22, 08401 Granollers, Barcelona",
    description: 'Casual place to work with a group',
    price: 25,
    user: user1,
    remote_photo_url: 'https://coworkingspain.es/sites/default/files/05_hw-cs.jpg'
  )
Booking.create(office: office2, user: user2)
office2.save!
puts "#{office2.name} created!"


office3 = Office.new(
    name: 'Comfortable working space',
    address: "25 Passeig de Gracia, Spain",
    description: 'Informal working space in city center',
    price: 15,
    user: user1,
    remote_photo_url: 'https://vortexcoworking.es/wp-content/uploads/2019/05/WAT-April-e1564498639805.jpg'
  )

Booking.create(office: office3, user: user2)
office3.save!
puts "#{office3.name} created!"


office4 = Office.new(
    name: 'Spacious balcony',
    address: "R. Mário Cardoso, Fanhões, Portugal",
    description: 'Perfect place to work during summers',
    price: 20,
    user: user1,
    remote_photo_url: 'https://www.travelinglifestyle.net/wp-content/uploads/2018/01/betahaus-barcelona.jpg'
  )

Booking.create(office: office4, user: user3)
office4.save!
puts "#{office4.name} created!"



office5 = Office.new(
    name: 'Living room for a group',
    address: "11 Place Saint-Michel, 75006 Paris, France",
    description: 'Ideal living room for co working',
    price: 15,
    user: user1,
    remote_photo_url: 'https://images.squarespace-cdn.com/content/v1/5cd2d784f8135a4ebed70b0f/1562750876987-J08ULOBOL3911YTVUGDG/ke17ZwdGBToddI8pDm48kGvplalqpkZZR-u_b9LPjJN7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0ooWhOa5cxQSJsU3rXf8luWMDGZFaScFoh_VgNWt1kTJ5b0qCG8UlEpxXoRE9n_diQ/annie-spratt-hCb3lIB8L8E-unsplash.jpg?format=1000w'
  )

Booking.create(office: office5, user: user3)
office5.save!
puts "#{office5.name} created!"


office6 = Office.new(
    name: 'Little room for small groups',
    address: "9 Allée René Ménard, 18000 Bourges, France",
    description: 'Perfect little space for co working',
    price: 20,
    user: user2,
    remote_photo_url: 'http://collabory.world/wp-content/uploads/2019/03/shutterstock-741463711.png'
  )

Booking.create(office: office6, user: user3)
office6.save!
puts "#{office6.name} created!"



office7 = Office.new(
    name: 'Ideal room with balcony',
    address: "Patio de Banderas, s/n, 41004 Sevilla",
    description: 'Ideal balcony with sea view for working with friends',
    price: 15,
    user: user2,
    remote_photo_url: 'https://www.coworkramblacatalunya.es/wp-content/uploads/2019/04/Espacios-de-coworking-Barcelona.jpg'
  )

Booking.create(office: office7, user: user3)
office7.save!
puts "#{office7.name} created!"



office8 = Office.new(
    name: 'Cool co working space',
    address: "Plaza de la Independencia, 7, 28001 Madrid",
    description: 'Cool space to have a relaxing working day',
    price: 25,
    user: user3,
    remote_photo_url: 'http://eud.leneurbanity.com/wp-content/uploads/2015/04/betahaus-Barcelona-window.jpg'
  )

Booking.create(office: office8, user: user1)
office8.save!
puts "#{office8.name} created!"

office9 = Office.new(
    name: 'Big living room',
    address: "Wapper 9-11, 2000 Antwerpen, Belgium",
    description: 'Have fun working with local co-workers',
    price: 10,
    user: user3,
    remote_photo_url: 'https://sgmagazine.com/sites/default/files/u143089/distrii_singapore_coworking.jpg'
  )

Booking.create(office: office9, user: user1)
office9.save!
puts "#{office9.name} created!"

office10 = Office.new(
    name: 'Cozy living room',
    address: "Plaza de la Independencia, 7, 28001 Madrid",
    description: 'Spend a lazy working day in this beautiful living room',
    price: 15,
    user: user3,
    remote_photo_url: 'https://i.pinimg.com/736x/3d/7a/f7/3d7af7fc736d43e27b1f52a80e0ed698.jpg'
  )

Booking.create(office: office10, user: user1)
office10.save!
puts "#{office10.name} created!"

days = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]

Schedule.destroy_all
puts "Schedules destroyed"
days.each do |day|
  Schedule.create(name: day)
  puts "#{day} was created"
end
