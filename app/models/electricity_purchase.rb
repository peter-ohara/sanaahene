class ElectricityPurchase < ElectricityEntry
  include PurchaseEntryable

  alias_attribute :purchased_amount, :amount

  def supporting_text
    "#{number_to_cedis amount} at #{happened_at.to_time.strftime("%l:%M %P")}"
  end

  def leading_content
    :shopping_cart
  end

  def trailing_content
    amount_delta
  end
end
