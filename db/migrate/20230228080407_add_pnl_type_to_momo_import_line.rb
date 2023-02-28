class AddPnlTypeToMomoImportLine < ActiveRecord::Migration[7.0]
  def change
    add_column :momo_import_lines, :pnl_type, :string, default: "uncategorized"
  end
end
