# frozen_string_literal: true

class EcobankImportLine < ApplicationRecord
  enum pnl_type: {
    "uncategorized": 'uncategorized',
    "income": 'income',
    "expense": 'expense',
    "transfer": 'transfer'
  }

  scope :group_by_day, -> { order(transaction_date: :desc, created_at: :asc).group_by(&:transaction_day) }

  def headline_text
    if received?
      'Received'
    else
      'Sent'
    end
  end

  def supporting_text
    description
  end

  def leading_content
    if received?
      :arrow_downward
    else
      :arrow_upward
    end
  end

  def trailing_content
    credit || debit
  end

  def transaction_day
    transaction_date.to_date
  end

  def received?
    credit.present?
  end

  def delta
    credit || -debit
  end

  def abs_delta
    delta.abs
  end
end
