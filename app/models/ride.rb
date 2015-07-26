class Ride < ActiveRecord::Base
  belongs_to :driver, class_name: 'User'
  has_many :passengers, class_name: 'User', through: :rides_passengers
  has_many :rides_passengers

  validates :from,       presence: true
  validates :to,         presence: true
  validates :places,     presence: true
  validates :start_date, presence: true
  validates :driver_id,  presence: true

  scope :completed, -> { where("start_date <= ?", Time.now) }
  scope :upcoming, -> { where("start_date > ?", Time.now) }

  def free_rides_count
    places - rides_passengers.where(status: RidesPassenger.statuses[:accepted]).count
  end

  def author?(current_user)
    current_user == driver
  end

  def free_rides?
    self.free_rides_count > 0
  end

  def requested?(current_user)
    !!rides_passengers.find_by(passenger_id: current_user.id)
  end
end
