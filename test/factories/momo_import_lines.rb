FactoryBot.define do
  factory :momo_import_line do
    transaction_date { "2023-02-27 20:03:35" }
    from_acct { "MyString" }
    from_name { "MyString" }
    from_no { "MyString" }
    trans_type { "MyString" }
    amount { "9.99" }
    fees { "9.99" }
    e_levy { "9.99" }
    bal_before { "9.99" }
    bal_after { "9.99" }
    to_no { "MyString" }
    to_name { "MyString" }
    to_acct { "MyString" }
    f_id { "MyString" }
    ref { "MyString" }
    ova { "MyString" }
  end
end
