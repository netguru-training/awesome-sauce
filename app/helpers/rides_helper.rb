module RidesHelper
  def request_ride_allowed?(ride)
    !ride.author?(current_user) && ride.free_rides? &&
      !ride.requested?(current_user) && current_user.present?
  end
end
