# frozen_string_literal: true

class MomoImportLine < ApplicationRecord
  include Transactionable

  COMPANY_ACCOUNT_NUMBER = '233555673531'

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
    to_no == COMPANY_ACCOUNT_NUMBER
  end

  def delta
    if received?
      amount
    else
      -(amount + fees + e_levy)
    end
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
