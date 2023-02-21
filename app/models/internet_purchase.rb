class InternetPurchase < InternetEntry
  include PurchaseEntryable

  alias_attribute :purchased_amount, :amount
  alias_attribute :purchased_quantity, :amount

  def supporting_text
    "#{attendee.first_name} purchased #{quantity} GB"
  end

  def leading_content
    :wifi
  end

  def trailing_content
    nil
  end

end
