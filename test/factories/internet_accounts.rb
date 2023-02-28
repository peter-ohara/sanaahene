FactoryBot.define do
  factory :internet_account do
    sequence(:name, 5006) { |n| "Internet Account #{n}" }
    usage_type { 'backup' }
    account_number { 'P0392010' }
    phone_number { '0500011506' }
    service_name { 'Ndifereke Neware Anwanakak' }
    reorder_point { '20.00' }
  end
end
