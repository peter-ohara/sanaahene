class CreateMomoImportLines < ActiveRecord::Migration[7.0]
  def change
    create_table :momo_import_lines do |t|
      t.datetime :transaction_date
      t.string :from_acct
      t.string :from_name
      t.string :from_no
      t.string :trans_type
      t.decimal :amount, precision: 8, scale: 2
      t.decimal :fees, precision: 8, scale: 2
      t.decimal :e_levy, precision: 8, scale: 2
      t.decimal :bal_before, precision: 8, scale: 2
      t.decimal :bal_after, precision: 8, scale: 2
      t.string :to_no
      t.string :to_name
      t.string :to_acct
      t.string :f_id
      t.string :ref
      t.string :ova

      t.timestamps
    end
  end
end
