class ElectricityPurchase < ElectricityEntry
  include PurchaseEntryable

  alias_attribute :purchased_amount, :amount

  def supporting_text
    "#{happened_at.to_time.strftime("%l:%M %P")} purchased #{number_to_cedis amount}"
  end

  def leading_content
    :cart
  end

  def trailing_content
    nil
  end
end
