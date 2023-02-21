class InternetEntry < ApplicationRecord
  include Entryable

  belongs_to :internet_account
  belongs_to :attendee, class_name: "User"

  def headline_text
    internet_account.name
  end

  def previous_entry
    self.internet_account.internet_entries
        .where(happened_at: ...self.happened_at)
        .order(:happened_at)
        .last
  end
end
