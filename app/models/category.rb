# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :binance_import_lines
  has_many :ecobank_import_lines
  has_many :momo_import_lines
  has_many :non_bank_transactions

  def transactions
    (binance_import_lines.cedi_transactions + ecobank_import_lines + momo_import_lines + non_bank_transactions)
      .sort_by(&:sort_order)
  end

  def transactions_by_day
    transactions.group_by(&:transaction_day)
  end

  def transactions_by_month
    transactions.group_by(&:transaction_month).sort
  end

  def transaction_sum_by_month
    transactions_by_month.map { |month, txs| [month.to_fs(:month_and_year), txs.sum(&:delta).abs] }
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
