class AddStatusToHauler < ActiveRecord::Migration[7.0]
  def change
    add_column :haulers, :status, :integer, default: 0
  end
end
