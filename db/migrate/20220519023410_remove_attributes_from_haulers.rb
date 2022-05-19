class RemoveAttributesFromHaulers < ActiveRecord::Migration[7.0]
  def change
    remove_column :haulers, :status, :boolean
    remove_column :haulers, :price, :decimal
  end
end
