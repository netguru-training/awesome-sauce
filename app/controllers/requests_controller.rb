class RequestsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :index]
  before_action :authenticate_driver!, only: [:update, :index]
  before_action :authenticate_passenger!, only: [:create]
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
      rides_passenger.update_attributes(status: RidesPassenger.statuses[:accepted])
    when 'deny'
      flash[:notice] = "Ride denied"
      rides_passenger.update_attributes(status: RidesPassenger.statuses[:rejected])
    end
    redirect_to ride_requests_path
  end

  private

  def authenticate_driver!
    return if ride.author?(current_user)
    flash[:error] = "You can display only requests from your rides."
    redirect_to ride_path(ride.id)
  end

  def authenticate_passenger!
    return if !ride.author?(current_user)
    flash[:error] = "You can request only other users rides."
    redirect_to ride_path(ride.id)
  end
end
