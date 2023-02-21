class ElectricityBalance < ElectricityEntry
  include BalanceEntryable

  alias_attribute :meter_balance, :amount

  def supporting_text
    "#{attendee.first_name} checked balance. (GHS #{amount_used} used)"
  end

  def leading_content
    :speed
  end

  def trailing_content
    "GHS #{amount}"
  end

end
