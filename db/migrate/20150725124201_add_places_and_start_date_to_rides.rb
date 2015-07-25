class AddPlacesAndStartDateToRides < ActiveRecord::Migration
  def change
    add_column :rides, :places, :integer
    add_column :rides, :start_date, :datetime
  end
end
