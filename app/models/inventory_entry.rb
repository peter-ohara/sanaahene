class InventoryEntry < ApplicationRecord
  belongs_to :item
  belongs_to :attendee, class_name: "User"
  belongs_to :meter, class_name: "ElectricityMeter"

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def creation_date
    happened_at.to_date
  end

  def delta
    0.to_d
  end

  def balance
    0.to_d
  end

  def previous_balance
    0.to_d
  end
end
