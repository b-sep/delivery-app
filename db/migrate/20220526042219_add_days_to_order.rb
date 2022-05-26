class AddDaysToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :days, :string
  end
end
