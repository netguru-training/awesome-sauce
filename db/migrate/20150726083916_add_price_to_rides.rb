class AddPriceToRides < ActiveRecord::Migration
  def change
    add_column :rides, :price, :decimal
  end
end
