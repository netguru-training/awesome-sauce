class RidesPassenger < ActiveRecord::Base
  belongs_to :ride
  belongs_to :passenger, class_name: 'User'
end
