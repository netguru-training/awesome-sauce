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
ride = Ride.create(from: 'Tomaszów', to: 'Warszawa', places: 5, start_date: Time.now + 2.days, driver: User.find_by_name("test1"))
RidesPassenger.create(passenger: User.find_by_name("test2"), ride: ride)
RidesPassenger.create(passenger: User.find_by_name("test3"), ride: ride)
RidesPassenger.create(passenger: User.find_by_name("test4"), ride: ride)

ride = Ride.create(from: 'Warszawa', to: 'Gdańsk', places: 5, start_date: Time.now + 3.days, driver: User.find_by_name("test0"))
RidesPassenger.create(passenger: User.find_by_name("test2"), ride: ride)

ride = Ride.create(from: 'Warszawa', to: 'Kraków', places: 5, start_date: Time.now + 3.days, driver: User.find_by_name("test1"))
RidesPassenger.create(passenger: User.find_by_name("test3"), ride: ride)
RidesPassenger.create(passenger: User.find_by_name("test4"), ride: ride)

ride = Ride.create(from: 'Wrocław', to: 'Poznań', places: 5, start_date: Time.now + 4.days, driver: User.find_by_name("test4"))
RidesPassenger.create(passenger: User.find_by_name("test1"), ride: ride)
RidesPassenger.create(passenger: User.find_by_name("test2"), ride: ride)
