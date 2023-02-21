FactoryBot.define do
  factory :electricity_balance do
    happened_at { "2023-02-20 08:15:18" }
    meter
    amount  { "30.00" }
    attendee
    notes  { "Some notes I left" }
  end
end
