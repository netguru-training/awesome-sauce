class RenamePlacesToFromInRides < ActiveRecord::Migration
  def change
    rename_column :rides, :to, :destination_city
    rename_column :rides, :from, :start_city
    rename_column :rides, :places, :seats
  end
end
