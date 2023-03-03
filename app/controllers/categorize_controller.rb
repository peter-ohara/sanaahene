# frozen_string_literal: true

class CategorizeController < ApplicationController
  def index
    @transactions = BinanceImportLine.cedi_transactions + MomoImportLine.all + EcobankImportLine.all + NonBankTransaction.all
    @transactions = @transactions.sort_by(&:sort_order)
  end

  def deck
    @transactions = BinanceImportLine.cedi_transactions + MomoImportLine.all + EcobankImportLine.all + NonBankTransaction.all

    expense_account_types = ['Cost of Service', 'Expenses']
    income_account_types = %w[Income Revenue]

    @sum_txs_by_account_type = @transactions.group_by(&:account_type).map { |at, txs| [at, txs.sum(&:delta)] }
    @expenses_by_month = @transactions.group_by(&:transaction_month).map do |month, txs|
      [month, - (txs.select { |tx| expense_account_types.include?(tx.account_type) }.sum(&:delta))]
    end
    @income_by_month = @transactions.group_by(&:transaction_month).map do |month, txs|
      [month, txs.select { |tx| income_account_types.include?(tx.account_type) }.sum(&:delta)]
    end

    @transactions = @transactions.select(&:uncategorized?) if params[:category] == 'null'
    @uncategorized_transactions = @transactions.sort_by(&:sort_order).group_by(&:transaction_day)
  end
end
