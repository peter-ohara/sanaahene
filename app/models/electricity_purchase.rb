class ElectricityPurchase < InventoryEntry
  include ElectricityEntry

  alias_attribute :purchased_amount, :amount

  def supporting_text
    "#{attendee.first_name} purchased GHS #{purchased_amount}"
  end

  def leading_content
    :cart
  end

  def delta
    purchased_amount
  end

  def balance
    previous_balance + purchased_amount
  end
end
