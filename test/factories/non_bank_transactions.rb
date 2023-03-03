FactoryBot.define do
  factory :non_bank_transaction do
    transaction_date { "2023-03-03 14:53:06" }
    transaction_type { "received" }
    counter_party { "MyString" }
    ref { "MyString" }
    amount { "9.99" }
    fees { "9.99" }
    e_levy { "9.99" }
    category { nil }
    notes { "MyText" }
  end
end
