class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :inventory_entries, through: :taggings
end
