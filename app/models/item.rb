class Item < ApplicationRecord

  has_many :electricity_entries, dependent: :destroy
end
