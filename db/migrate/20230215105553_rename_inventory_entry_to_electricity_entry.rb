class RenameInventoryEntryToElectricityEntry < ActiveRecord::Migration[7.0]
  def change
    rename_table :inventory_entries, :electricity_entries
    rename_column :taggings, :inventory_entry_id, :electricity_entry_id
  end
end
