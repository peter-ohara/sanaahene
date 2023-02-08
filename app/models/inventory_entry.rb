class InventoryEntry < ApplicationRecord
  belongs_to :item
  belongs_to :attendee, class_name: "User"

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def creation_date
    happened_at.to_date
  end
end
