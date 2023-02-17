class ElectricityBalance < ElectricityEntry
  include ElectricityEntryable

  alias_attribute :meter_balance, :amount

  def supporting_text
    "#{attendee.first_name} checked balance. (GHS #{used_amount} used)"
  end

  def leading_content
    :speed
  end

  def delta
    meter_balance - previous_balance
  end

  def used_amount
    delta * -1
  end

  def balance
    meter_balance
  end
end
