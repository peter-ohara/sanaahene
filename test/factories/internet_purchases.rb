# frozen_string_literal: true

FactoryBot.define do
  factory :internet_purchase do
    happened_at { '2023-02-20 08:15:18' }
    internet_account
    amount { '500.00' }
    quantity { '475.00' }
    attendee
    notes { 'Some notes I left' }
  end
end
