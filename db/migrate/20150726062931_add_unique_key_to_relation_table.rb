class AddUniqueKeyToRelationTable < ActiveRecord::Migration
  def change
    add_index :rides_passengers, [:passenger_id, :ride_id], :unique => true
  end
end
