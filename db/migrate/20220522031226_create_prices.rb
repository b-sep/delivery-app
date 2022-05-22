class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.decimal :min_cubic_meter
      t.decimal :max_cubic_meter
      t.integer :min_weight
      t.integer :max_weight
      t.decimal :km_price
      t.references :hauler, null: false, foreign_key: true

      t.timestamps
    end
  end
end
