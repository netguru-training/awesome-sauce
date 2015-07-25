class Ride < ActiveRecord::Base
  belongs_to :driver, class_name: 'User'
  has_many :passengers, class_name: 'User', through: :rides_passengers
  has_many :rides_passengers

  validates :from,       presence: true
  validates :to,         presence: true
  validates :places,     presence: true
  validates :start_date, presence: true
  validates :driver_id,  presence: true

  def free_rides_count
    rides_passengers.where.not(status: :taken)
  end
end
