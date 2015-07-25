class AddRideIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ride_id, :integer
  end
end
