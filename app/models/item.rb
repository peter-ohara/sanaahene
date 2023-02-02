class Item < ApplicationRecord
  has_many :inventory_entries, dependent: :destroy
end
