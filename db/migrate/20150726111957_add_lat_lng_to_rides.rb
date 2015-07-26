class AddLatLngToRides < ActiveRecord::Migration
  def change
    add_column :rides, :destination_city_lat, :string
    add_column :rides, :destination_city_lng, :string
    add_column :rides, :start_city_lat, :string
    add_column :rides, :start_city_lng, :string
  end
end
