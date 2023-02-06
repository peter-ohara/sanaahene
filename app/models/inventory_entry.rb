class InventoryEntry < ApplicationRecord
  belongs_to :item
  belongs_to :attendee, class_name: "User"

  after_initialize do
    self.happened_at = Time.zone.now
  end

  def creation_date
    happened_at.to_date
  end
end
