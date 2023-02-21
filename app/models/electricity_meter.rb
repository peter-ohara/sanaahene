class ElectricityMeter < ApplicationRecord
  has_many :electricity_entries, foreign_key: :meter_id, dependent: :destroy
  has_many :electricity_balances, foreign_key: :meter_id, dependent: :destroy
  has_many :electricity_purchases, foreign_key: :meter_id, dependent: :destroy

  def quantity_balance
    self.electricity_entries.order(:happened_at).last&.quantity_balance || 0.to_d
  end

  def amount_balance
    self.electricity_entries.order(:happened_at).last&.amount_balance || 0.to_d
  end

  def usage_by_day(date_range=nil)
    date_range = 1.week.ago.to_date..Date.today if date_range.nil?

    date_range.to_h { |day| [day, self.total_quantity_used(day.beginning_of_day..day.end_of_day)] }
  end

  def total_quantity_used(date_range)
    self.electricity_balances.where(
      happened_at: date_range
    ).sum(&:quantity_used)
  end

  def total_amount_used(date_range)
    self.electricity_balances.where(
      happened_at: date_range
    ).sum(&:amount_used)
  end

end
