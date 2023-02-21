FactoryBot.define do
  factory :electricity_purchase do
    happened_at { "2023-02-20 08:15:18" }
    meter
    amount  { "500.00" }
    attendee
    notes  { "Some notes I left" }
  end
end
