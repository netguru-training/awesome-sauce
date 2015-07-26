class RequestsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :index]
  before_action :authenticate_author!, only: [:create, :update, :index]
  expose(:rides_passenger)
  expose(:rides_passengers) { RidesPassenger.where(ride_id: params[:ride_id]) }
  expose(:ride)

  def create
    rides_passengers = RidesPassenger.new(
      ride_id: params[:ride_id],
      passenger: current_user,
      status: 1
    )
    if rides_passengers.save
      flash[:notice] = "Ride requested"
    else
      flash[:error] = "Ride not created"
    end
    redirect_to rides_path
  end

  def update
    case params[:type]
    when 'accept'
      flash[:notice] = "Ride accepted"
      rides_passenger.update_attributes(status: 2)
    when 'deny'
      flash[:notice] = "Ride denied"
      rides_passenger.update_attributes(status: -1)
    end
    redirect_to rides_path
  end

  private

  def authenticate_author!
    return if ride.author?(current_user)
    flash[:error] = "You can display only requests from your rides."
    redirect_to ride_path(ride.id)
  end
end
