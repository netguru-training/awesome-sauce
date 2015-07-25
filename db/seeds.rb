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
Ride.create(from: 'a', to: 'b', places: 5, start_date: Time.now + 2.days, driver: User.last)
RidesPassenger.create(passenger: User.find(5), ride: Ride.last)
