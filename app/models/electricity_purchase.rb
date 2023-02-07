class ElectricityPurchase < InventoryEntry
  include ElectricityEntry

  alias_attribute :purchased_amount, :amount

  def supporting_text
    "#{attendee.first_name} purchased GHS #{purchased_amount}"
  end

  def leading_content
    :cart
  end
end
