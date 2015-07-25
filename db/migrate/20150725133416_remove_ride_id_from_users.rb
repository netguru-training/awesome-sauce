class RemoveRideIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :ride_id
  end
end
