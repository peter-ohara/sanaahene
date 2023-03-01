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
    counterparty
  end

  def counterparty
    nil
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

  def bank
    'Ecobank'
  end

  def amount
    debit || credit
  end

  TANSACTION_TYPES = [
    'RVSLREF',
    'RVSLELEVY',
    'RVSLCHARGE',
    'RVSL OF UNSUCCESSFUL',
    'CHARGE GRA_ELEVYREF',
    'CHARGE REF',
    'ELEVY ON REF',
    'MTN_MOBILE_MONEY MOBILE',
    'REMOTE-ON-US',
    'Bank2Wallet',
    'Wallet2Bank',
    'LAUNDRY CHIEF LIMITED',
    'ATM WITHDRAWAL CHARGE',
    'ATM CASH WITHDRAWAL',
    'AIRTIME PURCHASE',
    'owners draw',
    "owner's draw",
  ].freeze
  def trans_type
    TANSACTION_TYPES.each do |type|
      return type if description.downcase.include? type.downcase
    end

    return "IFO" if description.include? "IFO"

    'Unknown'
  end

  def ova; end

  def fiat_type
    'GHS'
  end
end
