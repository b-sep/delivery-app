class CreateDeliveryDates < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_dates do |t|
      t.integer :distance_1
      t.integer :distance_2
      t.integer :days
      t.references :hauler, null: false, foreign_key: true

      t.timestamps
    end
  end
end
