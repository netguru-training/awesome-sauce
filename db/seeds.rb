# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = CreateAdminService.new.call
users = 5.times.collect do |i|
  User.create(email: "test#{i}@a.com", name: "test#{i}", password: 'asdasdasd', password_confirmation: 'asdasdasd')
end

ride = Ride.create(start_city: 'Tomaszów', destination_city: 'Warszawa', seats: 5, start_date: Time.now + 2.days, driver: users.at(1))
RidesPassenger.create(passenger: users.at(2), ride: ride)
RidesPassenger.create(passenger: users.at(3), ride: ride)
RidesPassenger.create(passenger: users.at(4), ride: ride)

ride = Ride.create(start_city: 'Warszawa', destination_city: 'Gdańsk', seats: 5, start_date: Time.now + 3.days, driver: users.at(0))
RidesPassenger.create(passenger: users.at(2), ride: ride)

ride = Ride.create(start_city: 'Warszawa', destination_city: 'Kraków', seats: 5, start_date: Time.now + 3.days, driver: users.at(1))
RidesPassenger.create(passenger: users.at(3), ride: ride)
RidesPassenger.create(passenger: users.at(4), ride: ride)

ride = Ride.create(start_city: 'Wrocław', destination_city: 'Poznań', seats: 5, start_date: Time.now + 4.days, driver: users.at(4))
RidesPassenger.create(passenger: users.at(1), ride: ride)
RidesPassenger.create(passenger: users.at(2), ride: ride)

Review.create(author: users.at(2), user: users.at(1), rating: 5, content: "Super ekstra!")
Review.create(author: users.at(3), user: users.at(1), rating: 3, content: "Jakby był mercedes byłoby 5.")
Review.create(author: users.at(4), user: users.at(1), rating: 4, content: "Fajnie, trochę miało.")

Review.create(author: users.at(2), user: users.at(0), rating: 1, content: "Tragedia, nie polecam.")

Review.create(author: users.at(1), user: users.at(4), rating: 5, content: "Świetnie, jeszcze razem pojedziemy :*")
Review.create(author: users.at(2), user: users.at(4), rating: 5, content: "Super, kierowca ma świetny gust muzyczny.")
