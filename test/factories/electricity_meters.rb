FactoryBot.define do
  factory :electricity_meter, aliases: [:meter] do
    sequence(:name, 5006) { |n| "#{n}" }
    meter_number { "P#{name}" }
    reorder_point { "10.00" }
  end
end
