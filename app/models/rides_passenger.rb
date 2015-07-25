class RidesPassenger < ActiveRecord::Base
  belongs_to :ride
  belongs_to :passenger, class_name: 'User'

  validates :passenger, presence: true
  validates :ride,      presence: true
  validates :status,    presence: true

  enum status: { accepted: 2, pending: 1, free: 0, rejected: -1 }
end
