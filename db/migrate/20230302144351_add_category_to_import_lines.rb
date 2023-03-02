class AddCategoryToImportLines < ActiveRecord::Migration[7.0]
  def change
    add_reference :binance_import_lines, :category, foreign_key: true
    add_reference :ecobank_import_lines, :category, foreign_key: true
    add_reference :momo_import_lines, :category, foreign_key: true
  end
end
