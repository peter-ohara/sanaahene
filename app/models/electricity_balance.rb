class ElectricityBalance < InventoryEntry
  include ElectricityEntry

  alias_attribute :meter_balance, :amount

  def supporting_text
    "#{attendee.first_name} checked balance. (GHS #{meter_balance} used)"
  end

  def leading_content
    :dial
  end

  def delta
    meter_balance - previous_balance
  end

  def balance
    meter_balance
  end
end
