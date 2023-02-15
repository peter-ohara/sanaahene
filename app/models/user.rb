class User < ApplicationRecord

  has_many :inventory_entries, foreign_key: :attendee_id, dependent: :destroy
  has_many :internet_entries, foreign_key: :attendee_id, dependent: :destroy

  def name
    "#{first_name} #{other_names} #{last_name}"
  end
  def creation_date
    created_at.to_date
  end
end
