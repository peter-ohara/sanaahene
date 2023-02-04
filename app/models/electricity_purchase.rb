class ElectricityPurchase < InventoryEntry
  belongs_to :item
  belongs_to :attendee, class_name: "User"
end
