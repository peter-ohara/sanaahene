class ElectricityEntry < ApplicationRecord
  include Entryable

  belongs_to :item
  belongs_to :attendee, class_name: "User"
  belongs_to :meter, class_name: "ElectricityMeter"

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
end
