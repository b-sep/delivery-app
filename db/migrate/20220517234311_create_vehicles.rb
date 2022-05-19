class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :license_plate
      t.integer :full_load
      t.string :car_model
      t.string :year
      t.string :vehicle_brand

      t.timestamps
    end
  end
end
