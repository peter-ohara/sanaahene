# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:name, 1) { |n| "Category #{n}" }
    account_type { 'Expense' }
  end
end
