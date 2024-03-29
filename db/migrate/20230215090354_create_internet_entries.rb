class CreateInternetEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :internet_entries do |t|
      t.datetime :happened_at, null: false
      t.references :internet_account, null: false, foreign_key: true
      t.decimal :amount, precision: 8, scale: 2
      t.decimal :quantity, precision: 8, scale: 2, null: false
      t.references :attendee, null: false, foreign_key: { to_table: :users }
      t.text :notes
      t.string :type, null: false

      t.timestamps
    end
  end
end
