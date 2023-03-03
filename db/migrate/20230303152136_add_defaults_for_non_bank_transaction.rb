# frozen_string_literal: true

class AddDefaultsForNonBankTransaction < ActiveRecord::Migration[7.0]
  def change
    change_column_default :non_bank_transactions, :fees, from: nil, to: 0
    change_column_default :non_bank_transactions, :e_levy, from: nil, to: 0
    change_column_default :non_bank_transactions, :transaction_type, from: nil, to: 'sent'
  end
end
