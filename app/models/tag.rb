class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :electricity_entries, through: :taggings
end
