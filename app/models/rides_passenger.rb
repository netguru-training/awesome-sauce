class RidesPassenger < ActiveRecord::Base
  belongs_to :ride
  belongs_to :passenger, class_name: 'User'

  validates :passenger, presence: true
  validates :ride,      presence: true
  validates :status,    presence: true

  enum status: { accepted: 1, pending: 0, rejected: -1 }

  def self.was_his_passenger?(passenger, driver)
    RidesPassenger.joins("JOIN rides ON (rides_passengers.ride_id = rides.id)")
    .where("rides_passengers.passenger_id = :passenger_id AND rides.driver_id = :driver_id",
          passenger_id: passenger.id, driver_id: driver.id)
    .where("rides_passengers.status = ?", RidesPassenger.statuses[:accepted])
    .where("rides.start_date < ?", Time.now).any?
  end
end
