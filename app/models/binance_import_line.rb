# frozen_string_literal: true

class BinanceImportLine < ApplicationRecord
  include Transactionable

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
    "#{fiat_type} #{total_price}"
  end

  def transaction_date
    created_time
  end

  def transaction_day
    transaction_date.to_date
  end

  def counterparty
    couterparty
  end

  def received?
    order_type == 'Buy'
  end

  def delta
    -total_price if received?

    total_price
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

  def trans_type
    order_type
  end

  def ova; end
end
