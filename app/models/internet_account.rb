class InternetAccount < ApplicationRecord
  has_many :internet_entries, dependent: :destroy
end
