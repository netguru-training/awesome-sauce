class RidesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_author!, only: [:edit, :update, :destroy]
  expose(:ride, attributes: :ride_params)
  expose(:rides)
  expose_decorated(:other_rides, decorator: RideDecorator) { Ride.other_users_rides(current_user) }

  def create
    ride.driver = current_user
    if ride.save
      redirect_to rides_path
    else
      render 'new'
    end
  end

  def update
    if ride.update_attributes(ride_params)
      redirect_to ride_path(ride.id)
    else
      render 'edit'
    end
  end

  def destroy
    ride.destroy
    redirect_to rides_path
  end

  private

  def ride_params
    params.require(:ride).permit(:start_city, :destination_city, :driver_id, :seats, :start_date)
  end

  def authenticate_author!
    return if ride.author?(current_user)
    flash[:error] = "You can delete only your rides."
    redirect_to ride_path(ride.id)
  end
end
