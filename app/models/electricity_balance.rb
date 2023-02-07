class ElectricityBalance < InventoryEntry
  include ElectricityEntry

  alias_attribute :meter_balance, :amount

  def supporting_text
    "#{attendee.first_name} checked balance. (GHS #{meter_balance} used)"
  end

  def leading_content
    :dial
  end
end
