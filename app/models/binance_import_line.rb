# frozen_string_literal: true

class BinanceImportLine < ApplicationRecord
  include Transactionable

  alias_attribute :trans_type, :order_type
  alias_attribute :counterparty, :couterparty


  CEDI = 'GHS'

  scope :cedi_transactions, -> { where(fiat_type: CEDI) }

  def headline_text
    counterparty
  end

  def supporting_text
    "#{order_type} #{quantity} #{asset_type} at #{price}"
  end

  def leading_content
    if received?
      :arrow_downward
    else
      :arrow_upward
    end
  end

  def trailing_content
    ActionController::Base.helpers.number_to_currency amount, unit: "#{fiat_type} "
  end

  def transaction_date
    created_time
  end

  def transaction_day
    transaction_date.to_date
  end

  def received?
    order_type == 'Buy'
  end

  def delta
    return 0 unless fiat_type == CEDI

    if received?
      total_price
    else
      -total_price
    end
  end

  def abs_delta
    delta.abs
  end

  def bank
    'Binance'
  end

  def amount
    total_price
  end
end
