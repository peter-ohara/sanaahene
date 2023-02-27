class DailyElectricityStat
  include ActiveModel::Model
  include ActiveRecord::Attributes

  attr_accessor :meter, :date

  attr_reader :used
  attr_reader :purchased
  attr_reader :starting_balance
  attr_reader :ending_balance

  def date_range
    date.beginning_of_day..date.end_of_day
  end

  def used
    meter.electricity_balances.where(
      happened_at: date_range
    ).sum(&:amount_used)
  end

  def purchased
    meter.electricity_purchases.where(
      happened_at: date_range
    ).sum(&:amount)
  end

  def starting_balance
    meter.electricity_entries.where(
      happened_at: date_range
    ).order(:happened_at).last&.amount_balance || 0.to_d
  end


  def ending_balance
    meter.electricity_entries.where(
      happened_at: date_range
    ).order(:happened_at).last&.amount_balance || 0.to_d
  end

  def self.for_days(meter:, date_range:)
    date_range.map { |d| DailyElectricityStat.new(meter: meter, date_range: d) }
  end
end

