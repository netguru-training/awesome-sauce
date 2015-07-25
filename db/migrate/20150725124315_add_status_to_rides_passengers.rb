class AddStatusToRidesPassengers < ActiveRecord::Migration
  def change
    add_column :rides_passengers, :status, :integer, default: 0
  end
end
