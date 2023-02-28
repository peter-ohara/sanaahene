# frozen_string_literal: true

FactoryBot.define do
  factory :internet_balance do
    happened_at { '2023-02-20 08:15:18' }
    internet_account
    amount { '30.00' }
    quantity { '30.00' }
    attendee
    notes { 'Some notes I left' }
  end
end
