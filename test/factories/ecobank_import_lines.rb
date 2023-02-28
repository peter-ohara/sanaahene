FactoryBot.define do
  factory :ecobank_import_line do
    transaction_date { "2023-02-28 13:15:40" }
    description { "MyString" }
    reference { "MyString" }
    debit { "9.99" }
    credit { "9.99" }
    balance { "9.99" }
    pnl_type { "uncategorized" }
    notes { "MyText" }
  end
end
