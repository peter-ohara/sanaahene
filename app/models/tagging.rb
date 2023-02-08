class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :inventory_entry
end
