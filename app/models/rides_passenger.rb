class RidesPassenger < ActiveRecord::Base
  belongs_to :ride
  belongs_to :passenger, class_name: 'User'

  validates :passenger, presence: true
  validates :ride,      presence: true
  validates :status,    presence: true

  enum status: { accepted: 1, pending: 0, rejected: -1 }
end
