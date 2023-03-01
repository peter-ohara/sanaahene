# frozen_string_literal: true

class MomoImportLine < ApplicationRecord
  enum pnl_type: {
    "uncategorized": 'uncategorized',
    "income": 'income',
    "expense": 'expense',
    "transfer": 'transfer'
  }

  scope :group_by_day, -> { order(transaction_date: :desc, created_at: :asc).group_by(&:transaction_day) }

  def headline_text
    counterparty
  end

  def counterparty
    if received?
      from_name.to_s
    else
      to_name.to_s
    end
  end

  def supporting_text
    ref
  end

  def leading_content
    if received?
      :arrow_downward
    else
      :arrow_upward
    end
  end

  def trailing_content
    amount
  end

  def transaction_day
    transaction_date.to_date
  end

  def received?
    delta.positive?
  end

  def delta
    bal_after - bal_before
  end

  def abs_delta
    delta.abs
  end

  def bank
    'Momo'
  end
end
