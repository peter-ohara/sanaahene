# frozen_string_literal: true

class MomoImportLine < ApplicationRecord
  include Transactionable

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

  def fiat_type
    'GHS'
  end
end
