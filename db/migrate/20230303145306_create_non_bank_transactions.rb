class CreateNonBankTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :non_bank_transactions do |t|
      t.datetime :transaction_date, null: false
      t.string :transaction_type, null: false
      t.string :counter_party, null: false
      t.text :ref, null: false
      t.decimal :amount, precision: 8, scale: 2, null: false
      t.decimal :fees, precision: 8, scale: 2
      t.decimal :e_levy, precision: 8, scale: 2
      t.references :category, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
