FactoryBot.define do
  factory :binance_import_line do
    order_number { "MyString" }
    order_type { "Sell" }
    asset_type { "USDT" }
    fiat_type { "GHS" }
    total_price { "99.90" }
    price { "9.99" }
    quantity { "10.00" }
    exchange_rate { "" }
    couterparty { "Prime" }
    status { "Completed" }
    created_time { "2023-03-01 10:13:10" }
  end
end
