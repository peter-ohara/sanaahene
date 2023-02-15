class CreateInternetAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :internet_accounts do |t|
      t.string :name
      t.string :usage_type
      t.string :account_number
      t.string :phone_number
      t.string :service_name
      t.decimal :reorder_point, precision: 8, scale: 2

      t.timestamps
    end
    add_index :internet_accounts, :name, unique: true
  end
end
