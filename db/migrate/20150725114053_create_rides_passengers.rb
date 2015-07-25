class CreateRidesPassengers < ActiveRecord::Migration
  def change
    create_table :rides_passengers do |t|
      t.integer :passenger_id
      t.integer :ride_id

      t.timestamps null: false
    end
  end
end
