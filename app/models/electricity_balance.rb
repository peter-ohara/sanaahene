class ElectricityBalance < InventoryEntry

  after_initialize do
    self.item = Item.find_or_create_by! name: "Electricity"
  end

  alias_attribute :meter_balance, :amount

  attribute :meter, :string, default: '4006'

  def headline_text
    meter
  end

  def supporting_text
    "#{attendee.first_name} purchased (GHS #{meter_balance})"
  end

  def leading_content
    :dial
  end

  def trailing_content
    "GHS #{meter_balance}"
  end

end
