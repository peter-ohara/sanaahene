# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:name, 1) { |n| "Category #{n}" }
    account_type { 'cost_of_service' }
  end
end
