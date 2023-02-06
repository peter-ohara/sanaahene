class ElectricityPurchase < InventoryEntry

  after_initialize do |electricity_purchase|
    self.item = Item.find_or_create_by! name: "Electricity"
  end

  alias_attribute :purchased_amount, :amount

  attribute :meter, :string, default: '4006'

  def headline_text
    meter
  end

  def supporting_text
    "#{attendee.first_name} purchased (GHS #{purchased_amount})"
  end

  def leading_content
    :cart
  end

  def trailing_content
    "GHS #{purchased_amount}"
  end
end
