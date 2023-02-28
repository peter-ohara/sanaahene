class AddNotesToMomoImportLines < ActiveRecord::Migration[7.0]
  def change
    add_column :momo_import_lines, :notes, :text
    change_column_null :momo_import_lines, :pnl_type, false
  end
end
