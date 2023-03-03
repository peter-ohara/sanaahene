# frozen_string_literal: true

class NonBankTransaction < ApplicationRecord
  include Transactionable

  enum transaction_type: %i[received sent].index_with(&:to_s)

  alias_attribute :counterparty, :counter_party
  alias_attribute :trans_type, :transaction_type

  def headline_text
    counterparty
  end

  def supporting_text
    ActionController::Base.helpers.truncate ref
  end

  def trailing_content
    ActionController::Base.helpers.number_to_currency amount, unit: 'GHS '
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
    'NonBank'
  end

  def fiat_type
    'GHS'
  end
end
