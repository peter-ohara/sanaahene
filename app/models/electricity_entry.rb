class ElectricityEntry < ApplicationRecord
  include Entryable

  belongs_to :attendee, class_name: "User"
  belongs_to :meter, class_name: "ElectricityMeter"

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def quantity
    amount
  end

  def headline_text
    meter.name
  end

  def previous_entry
    self.meter.electricity_entries
        .where(happened_at: ...self.happened_at)
        .order(:happened_at)
        .last
  end

end
