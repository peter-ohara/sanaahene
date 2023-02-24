class ElectricityBalance < ElectricityEntry
  include BalanceEntryable

  alias_attribute :meter_balance, :amount

  def supporting_text
    "#{happened_at.to_time.strftime("%l:%M %P")} used #{number_to_cedis amount_used}"
  end

  def leading_content
    :speed
  end

  def trailing_content
    number_to_cedis amount
  end
end
