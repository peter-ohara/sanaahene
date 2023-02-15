class InternetEntry < ApplicationRecord
  include Entryable

  belongs_to :internet_account
  belongs_to :attendee, class_name: "User"
end
