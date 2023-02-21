class ElectricityPurchase < ElectricityEntry
  include PurchaseEntryable

  alias_attribute :purchased_amount, :amount

  def supporting_text
    "#{attendee.first_name} purchased GHS #{purchased_amount}"
  end

  def leading_content
    :cart
  end

  def trailing_content
    nil
  end

end
