# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :binance_import_lines
  has_many :ecobank_import_lines
  has_many :momo_import_lines

  def transactions
    (binance_import_lines.cedi_transactions + ecobank_import_lines + momo_import_lines).sort_by(&:sort_order)
  end

  def transactions_by_day
    transactions.group_by(&:transaction_day)
  end

  def transaction_count
    transactions.count
  end

  def delta
    transactions.sum(&:delta)
  end

  def trailing_content
    ActionController::Base.helpers.number_to_currency delta, unit: 'GHS '
  end
end
