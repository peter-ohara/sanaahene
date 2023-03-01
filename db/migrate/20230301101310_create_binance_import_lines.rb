# frozen_string_literal: true

class CreateBinanceImportLines < ActiveRecord::Migration[7.0]
  def change
    create_table :binance_import_lines do |t|
      t.string :order_number
      t.string :order_type
      t.string :asset_type
      t.string :fiat_type
      t.decimal :total_price, precision: 8, scale: 2
      t.decimal :price, precision: 10, scale: 4
      t.decimal :quantity, precision: 8, scale: 2
      t.decimal :exchange_rate, precision: 8, scale: 2
      t.string :couterparty
      t.string :status
      t.datetime :created_time
      t.string 'pnl_type', default: 'uncategorized', null: false
      t.text 'notes'
      t.timestamps
    end
  end
end
