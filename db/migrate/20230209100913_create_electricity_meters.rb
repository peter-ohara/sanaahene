class CreateElectricityMeters < ActiveRecord::Migration[7.0]
  def change
    create_table :electricity_meters do |t|
      t.string :name, null: false
      t.string :meter_number, null: false
      t.decimal :reorder_point, precision: 8, scale: 2, null: false

      t.timestamps
    end
    add_index :electricity_meters, :name, unique: true
    add_index :electricity_meters, :meter_number, unique: true
  end
end
