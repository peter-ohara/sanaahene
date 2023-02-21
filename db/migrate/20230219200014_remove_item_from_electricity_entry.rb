class RemoveItemFromElectricityEntry < ActiveRecord::Migration[7.0]
  def change
    remove_reference :electricity_entries, :item, null: false, foreign_key: true
  end
end
