class InventoryEntry < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :item
end
