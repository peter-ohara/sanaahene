class ElectricityMeter < ApplicationRecord
  has_many :inventory_entries, foreign_key: :meter_id, dependent: :destroy

  def balance
    self.inventory_entries.order(:happened_at).last&.balance || 0.to_d
  end

  def reorder_point
    50.to_d
  end
end
