class ElectricityMeter < ApplicationRecord
  has_many :electricity_entries, foreign_key: :meter_id, dependent: :destroy
  has_many :electricity_balances, foreign_key: :meter_id, dependent: :destroy
  has_many :electricity_purchases, foreign_key: :meter_id, dependent: :destroy

  def amount_balance
    self.electricity_entries.order(:happened_at).last&.amount_balance || 0.to_d
  end

  def usage_by_day(date_range=nil)
    date_range = 1.week.ago.to_date..Date.today if date_range.nil?

    date_range.to_h { |day| [day, self.amount_used(day.beginning_of_day..day.end_of_day)] }
  end

  def amount_used(date_range)
    self.electricity_balances.where(
      happened_at: date_range
    ).sum(&:amount_used)
  end

  def amount_purchased(date_range)
    self.electricity_purchases.where(
      happened_at: date_range
    ).sum(&:amount)
  end

  def amount_starting_balance(date_range)
    self.electricity_entries.where(
      happened_at: date_range
    ).order(:happened_at).last&.amount_balance || 0.to_d
  end

  def amount_ending_balance(date_range)
    self.electricity_entries.where(
      happened_at: date_range
    ).order(:happened_at).last&.amount_balance || 0.to_d
  end

  def self.amount_used(date_range)
    ElectricityMeter.all.sum(0) do |meter|
      meter.amount_used(date_range)
    end
  end

  def self.amount_purchased(date_range)
    ElectricityMeter.all.sum(0) do |meter|
      meter.amount_purchased(date_range)
    end
  end

end
