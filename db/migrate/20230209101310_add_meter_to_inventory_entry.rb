class AddMeterToInventoryEntry < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventory_entries, :meter, null: false, foreign_key: { to_table: :electricity_meters }
  end
end
