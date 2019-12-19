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

user1 = User.create!(first_name: 'Angelica', last_name: 'Moffarts', email: 'angelica@airwork.com', password: 'password', avatar: 'https://ca.slack-edge.com/T02NE0241-UP96TAG67-9eb3437bec64-512')
user2 = User.create!(first_name: 'Thomas', last_name: 'Julien', email: 'thomas@airwork.com', password: 'password', avatar: 'https://ca.slack-edge.com/T02NE0241-UP9P145FU-5c9d7959b92f-512')
user3 = User.create!(first_name: 'Smruthi', last_name: 'Lattupalli', email: 'smruthi@airwork.com', password: 'password', avatar: 'https://ca.slack-edge.com/T02NE0241-UPE3UGVHP-ca0511be2cc0-512')
user4 = User.create!(first_name: 'Nico', last_name: 'Proto', email: 'nico@airwork.com', password: 'password', avatar: 'https://ca.slack-edge.com/T02NE0241-UKPKXKN3V-63e484c7b1df-512')

### Offices for user 1 ###

office1 = Office.new(
    name: 'Ideal room with balcony',
    address: "Patio de Banderas, s/n, 41004 Sevilla",
    description: 'Ideal balcony with sea view for working with friends',
    price: 15,
    capacity: 4,
    user: user1,
    remote_photo_url: 'https://www.coworkramblacatalunya.es/wp-content/uploads/2019/04/Espacios-de-coworking-Barcelona.jpg'
  )

office1.save!
puts "#{office1.name} created!"

office2 = Office.new(
    name: 'Big living room',
    address: "Wapper 9-11, 2000 Antwerpen, Belgium",
    description: 'Have fun working with local co-workers',
    price: 10,
    capacity: 5,
    user: user1,
    remote_photo_url: 'https://sgmagazine.com/sites/default/files/u143089/distrii_singapore_coworking.jpg'
  )

office2.save!
puts "#{office2.name} created!"

### Offices for user 2 ###

office3 = Office.new(
    name: 'Spacious living room',
    address: "Carrer de Ca N'Oliva, 54, 08020 Barcelona",
    description: 'Nice place for small and big groups',
    price: 7,
    capacity: 4,
    user: user2,
    remote_photo_url: 'https://www.washingtonian.com/wp-content/uploads/2019/11/Copy-of-Bethesda_001-1-1500x1000.jpg'
  )

office3.save!
puts "#{office3.name} created!"


office4 = Office.new(
    name: 'Cozy working space',
    address: "Carrer del Rec, 22, 08401 Granollers, Barcelona",
    description: 'Casual place to work with a group',
    price: 25,
    capacity: 5,
    user: user2,
    remote_photo_url: 'https://coworkingspain.es/sites/default/files/05_hw-cs.jpg'
  )

office4.save!
puts "#{office4.name} created!"


office5 = Office.new(
    name: 'Comfy working space',
    address: "25 Passeig de Gracia, Spain",
    description: 'Informal working space in city center',
    price: 15,
    capacity: 8,
    user: user2,
    remote_photo_url: 'https://vortexcoworking.es/wp-content/uploads/2019/05/WAT-April-e1564498639805.jpg'
  )

office5.save!
puts "#{office5.name} created!"

### Offices for user 3 ###


office6 = Office.new(
    name: 'Spacious balcony',
    address: "Calle de Alcalá, 13, 28014 Madrid",
    description: 'Perfect place to work during summers',
    price: 20,
    capacity: 8,
    user: user3,
    remote_photo_url: 'https://www.travelinglifestyle.net/wp-content/uploads/2018/01/betahaus-barcelona.jpg'
  )

office6.save!
puts "#{office6.name} created!"



office7 = Office.new(
    name: 'Living room for a group',
    address: "11 Place Saint-Michel, 75006 Paris, France",
    description: 'Ideal living room for co working',
    price: 15,
    capacity: 5,
    user: user3,
    remote_photo_url: 'https://images.squarespace-cdn.com/content/v1/5cd2d784f8135a4ebed70b0f/1562750876987-J08ULOBOL3911YTVUGDG/ke17ZwdGBToddI8pDm48kGvplalqpkZZR-u_b9LPjJN7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0ooWhOa5cxQSJsU3rXf8luWMDGZFaScFoh_VgNWt1kTJ5b0qCG8UlEpxXoRE9n_diQ/annie-spratt-hCb3lIB8L8E-unsplash.jpg?format=1000w'
  )

office7.save!
puts "#{office7.name} created!"


office8 = Office.new(
    name: 'Little room for small groups',
    address: "9 Allée René Ménard, 18000 Bourges, France",
    description: 'Perfect little space for co working',
    price: 20,
    capacity: 8,
    user: user2,
    remote_photo_url: 'http://collabory.world/wp-content/uploads/2019/03/shutterstock-741463711.png'
  )

office8.save!
puts "#{office8.name} created!"


### Offices for user 4 ###

office9 = Office.new(
    name: 'Cool co working space',
    address: "Plaza de la Independencia, 7, 28001 Madrid",
    description: 'Cool space to have a relaxing working day',
    price: 25,
    capacity: 4,
    user: user4,
    remote_photo_url: 'http://eud.leneurbanity.com/wp-content/uploads/2015/04/betahaus-Barcelona-window.jpg'
  )

office9.save!
puts "#{office9.name} created!"


office10 = Office.new(
    name: 'Cozy living room',
    address: "Plaza de la Independencia, 7, 28001 Madrid",
    description: 'Spend a lazy working day in this beautiful living room',
    price: 7,
    capacity: 5,
    user: user4,
    remote_photo_url: 'https://i.pinimg.com/736x/3d/7a/f7/3d7af7fc736d43e27b1f52a80e0ed698.jpg'
  )

office10.save!
puts "#{office10.name} created!"


office11 = Office.new(
    name: 'Lovely shared room',
    address: "Placa de Lesseps, 20, 08023 Barcelona",
    description: 'Nice shared area to work with fellow co-workers',
    price: 10,
    capacity: 5,
    user: user4,
    remote_photo_url: 'https://www.iamsterdam.com/media/startups/coworking-spaces/rent24-amsterdam-coworking-space.jpg'
  )

office11.save!
puts "#{office11.name} created!"

office12 = Office.new(
    name: 'Pretty little space',
    address: "Carrer de Provença, 480, 08025 Barcelona",
    description: 'Spend your work day in this lovely space',
    price: 12,
    capacity: 7,
    user: user4,
    remote_photo_url: 'https://www.rent24.com/wp-content/uploads/xRent24-Magna-Plaza-Interior-Ashkan-Mortezapour-Photography-33-of-44-3-1050x700.jpg.pagespeed.ic.oJPfGFdX6j.jpg'
  )

office12.save!
puts "#{office12.name} created!"

office13 = Office.new(
    name: 'Ideal working space',
    address: "Passeig de Sant Joan, 181, 08012 Barcelona",
    description: 'Perfect place for your working day',
    price: 7,
    capacity: 4,
    user: user4,
    remote_photo_url: 'http://hellolivingroom.com/wp-content/uploads/2017/07/DSC_0668_Fotor_resized-1100x733.jpg'
  )

office13.save!
puts "#{office13.name} created!"


### Offices for user 2 & 3 ###

office14 = Office.new(
    name: 'Beach side work place',
    address: "Passeig Marítim, 08860 Castelldefels, Barcelona",
    description: 'Cool space to have a relaxing working day',
    price: 8,
    capacity: 10,
    user: user2,
    remote_photo_url: 'https://www.mydeskhub.com/wp-content/uploads/2017/02/coworkers-The-Beach-Factory.Castelldefels-Coworking-open-space.jpg'
  )

office14.save!
puts "#{office14.name} created!"


office15 = Office.new(
    name: 'Terrace for working day',
    address: "Carrer del Progrés, 69, 08850 Gavà, Barcelona",
    description: 'Out door space to enjoy your work day',
    price: 7,
    capacity: 5,
    user: user2,
    remote_photo_url: 'https://originworkspace.co.uk/app/uploads/2019/07/origin-terrace.jpg'
  )

office15.save!
puts "#{office15.name} created!"


office16 = Office.new(
    name: 'Nice living room',
    address: "08940 Cornellà de Llobregat, Barcelona",
    description: 'Nice work area to spend long work hours',
    price: 12,
    capacity: 8,
    user: user3,
    remote_photo_url: 'http://www.deskmag.com/img/articleimages/468x351/deskmag-coworking-5419.png'
  )

office16.save!
puts "#{office16.name} created!"

### Schedules ###

days = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
Schedule.destroy_all
puts "Schedules destroyed"
days.each do |day|
  Schedule.create(name: day)
  puts "#{day} was created"
end


### Bookings ####

Booking.create!(office: office1, user: user2, status: 'Closed', start_date: "02-12-2019", end_date: "05-12-2019")
Booking.create!(office: office2, user: user3, start_date: "28-12-2019", end_date: "31-12-2019")
booking1 = Booking.create!(office: office3, user: user4, status: 'Closed', start_date: "02-04-2019", end_date: "05-04-2019")
booking2 = Booking.create!(office: office3, user: user3, status: 'Closed', start_date: "02-02-2019", end_date: "05-02-2019")
Booking.create!(office: office4, user: user4, start_date: "02-01-2020", end_date: "05-01-2020")
Booking.create!(office: office5, user: user3, start_date: "05-01-2020", end_date: "07-01-2020")
Booking.create!(office: office6, user: user2, start_date: "05-01-2020", end_date: "07-01-2020")
Booking.create!(office: office7, user: user4, start_date: "15-01-2020", end_date: "17-01-2020")
Booking.create!(office: office8, user: user1, status: 'Closed', start_date: "02-11-2019", end_date: "05-11-2019")
Booking.create!(office: office9, user: user3, start_date: "15-01-2020", end_date: "17-01-2020")
Booking.create!(office: office10, user: user1, start_date: "25-01-2020", end_date: "27-01-2020")
Booking.create!(office: office11, user: user2, start_date: "25-01-2020", end_date: "27-01-2020")
Booking.create!(office: office12, user: user3, start_date: "25-01-2020", end_date: "27-01-2020")
Booking.create!(office: office13, user: user3, start_date: "25-01-2020", end_date: "27-01-2020")

puts "#{Booking.count} bookings created!"


### Reviews ####

Review.create!(booking: booking1, rating: 4, content: "An ideal place for a work day")
Review.create!(booking: booking2, rating: 5, content: "Perfect place for a long working day")
