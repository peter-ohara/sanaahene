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
    if received?
      from_name.to_s
    else
      to_name.to_s
    end
  end

  def supporting_text
    if received?
      "Received (#{ref})"
    else
      "Sent (#{ref})"
    end
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
    (bal_after - bal_before).positive?
  end
end
