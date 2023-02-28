# frozen_string_literal: true

class CreateEcobankImportLines < ActiveRecord::Migration[7.0]
  def change
    create_table :ecobank_import_lines do |t|
      t.datetime :transaction_date
      t.string :description
      t.string :reference
      t.decimal :debit, precision: 8, scale: 2
      t.decimal :credit, precision: 8, scale: 2
      t.decimal :balance, precision: 8, scale: 2
      t.string :pnl_type, null: false, default: 'uncategorized'
      t.text :notes

      t.timestamps
    end
  end
end
