class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :electricity_entry
end
