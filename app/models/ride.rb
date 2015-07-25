class Ride < ActiveRecord::Base
  belongs_to :driver, class_name: 'User'
  has_many :passengers, class_name: 'User', through: :rides_passengers
  has_many :rides_passengers
end
