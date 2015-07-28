# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = CreateAdminService.new.call
users = 5.times.collect do |i|
  User.create(
    email: "test#{i}@a.com",
    name: "test#{i}",
    password: 'asdasdasd',
    password_confirmation: 'asdasdasd'
  )
end

ride = Ride.create!(
  start_city: 'Tomaszów',
  start_city_lat: '51.5311945',
  start_city_lng: '20.008647099999962',
  destination_city: 'Warszawa',
  destination_city_lat: '52.2296756',
  destination_city_lng: '21.012228700000037',
  seats: 5,
  start_date: Time.now + 2.days,
  driver: users.at(1),
  price: 20
)

RidesPassenger.create(passenger: users.at(2), ride: ride, status: :pending)
RidesPassenger.create(passenger: users.at(3), ride: ride, status: :accepted)
RidesPassenger.create(passenger: users.at(4), ride: ride, status: :accepted)

ride = Ride.create(
  start_city: 'Warszawa',
  start_city_lat: "52.2296756",
  start_city_lng: "21.012228700000037",
  destination_city: 'Gdańsk',
  destination_city_lat: "54.35202520000001",
  destination_city_lng: "18.64663840000003",
  seats: 5,
  start_date: Time.now + 3.days,
  driver: users.at(0),
  price: 30
)

ride = Ride.create(
  start_city: 'Warszawa',
  start_city_lat: "52.2296756",
  start_city_lng: "21.012228700000037",
  destination_city: 'Gdańsk',
  destination_city_lat: "54.35202520000001",
  destination_city_lng: "18.64663840000003",
  seats: 5,
  start_date: Time.now - 3.days,
  driver: users.at(0),
  price: 30
)

RidesPassenger.create(passenger: users.at(2), ride: ride, status: :pending)

ride = Ride.create(
  start_city: 'Warszawa',
  start_city_lat: "52.2296756",
  start_city_lng: "21.012228700000037",
  destination_city: 'Kraków',
  destination_city_lat: "50.06465009999999",
  destination_city_lng: "19.94497990000002",
  seats: 5,
  start_date: Time.now + 3.days,
  driver: users.at(1),
  price: 15
)

ride = Ride.create(
  start_city: 'Warszawa',
  start_city_lat: "52.2296756",
  start_city_lng: "21.012228700000037",
  destination_city: 'Kraków',
  destination_city_lat: "50.06465009999999",
  destination_city_lng: "19.94497990000002",
  seats: 5,
  start_date: Time.now - 3.days,
  driver: users.at(1),
  price: 15
)
RidesPassenger.create(passenger: users.at(3), ride: ride, status: :rejected)
RidesPassenger.create(passenger: users.at(4), ride: ride, status: :accepted)

ride = Ride.create(
  start_city: 'Wrocław',
  start_city_lat: "51.1078852",
  start_city_lng: "17.03853760000004",
  destination_city: 'Poznań',
  destination_city_lat: "52.406374",
  destination_city_lng: "16.925168100000064",
  seats: 5,
  start_date: Time.now + 4.days,
  driver: users.at(4),
  price: 25
)

ride = Ride.create(
  start_city: 'Wrocław',
  start_city_lat: "51.1078852",
  start_city_lng: "17.03853760000004",
  destination_city: 'Poznań',
  destination_city_lat: "52.406374",
  destination_city_lng: "16.925168100000064",
  seats: 5,
  start_date: Time.now - 4.days,
  driver: users.at(4),
  price: 25
)

RidesPassenger.create(passenger: users.at(1), ride: ride, status: :accepted)
RidesPassenger.create(passenger: users.at(2), ride: ride, status: :accepted)

Review.create(author: users.at(2), user: users.at(1), rating: 5,
              content: "Super ekstra!")
Review.create(author: users.at(3), user: users.at(1), rating: 3,
              content: "Jakby był mercedes byłoby 5.")
Review.create(author: users.at(4), user: users.at(1), rating: 4,
              content: "Fajnie, trochę miało.")

Review.create(author: users.at(2), user: users.at(0), rating: 1,
              content: "Tragedia, nie polecam.")

Review.create(author: users.at(1), user: users.at(4), rating: 5,
              content: "Świetnie, jeszcze razem pojedziemy :*")
Review.create(author: users.at(2), user: users.at(4), rating: 5,
              content: "Super, kierowca ma świetny gust muzyczny.")
