class AddAttributesToHauler < ActiveRecord::Migration[7.0]
  def change
    add_column :haulers, :status, :boolean
    add_column :haulers, :price, :decimal
  end
end
