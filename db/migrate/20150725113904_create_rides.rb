class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :from
      t.string :to
      t.integer :driver_id

      t.timestamps null: false
    end
  end
end
