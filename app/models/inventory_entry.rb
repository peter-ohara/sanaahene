class InventoryEntry < ApplicationRecord
  belongs_to :item
  belongs_to :attendee, class_name: "User"
end
