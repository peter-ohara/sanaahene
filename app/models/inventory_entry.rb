class InventoryEntry < ApplicationRecord
  belongs_to :item
  belongs_to :attendee, class_name: "User"

  def creation_date
    happened_at.to_date
  end
end
