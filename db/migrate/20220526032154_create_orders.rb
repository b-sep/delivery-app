class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :heigth
      t.integer :depth
      t.integer :width
      t.integer :distance
      t.integer :weight
      t.references :hauler, null: false, foreign_key: true
      t.integer :status
      t.string :code

      t.timestamps
    end
  end
end
