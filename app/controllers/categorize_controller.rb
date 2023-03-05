# frozen_string_literal: true

class CategorizeController < ApplicationController
  def index
    @transactions = search_form.transactions.sort_by(&:sort_order)
  end

  def deck
    @transactions = BinanceImportLine.cedi_transactions + MomoImportLine.all + EcobankImportLine.all + NonBankTransaction.all
    @transactions = @transactions.sort_by(&:sort_order)

    @by_month = Category.all.map { |category| { name: category.name, data: category.transaction_sum_by_month } }

    @sum_txs_by_account_type = @transactions.group_by(&:account_type).map { |at, txs| [at, txs.sum(&:delta).abs] }

    @revenue_by_month = sum_by_month(@transactions.select { |tx| tx.account_type == REVENUE })
    @cost_of_service_by_month = sum_by_month(@transactions.select { |tx| tx.account_type == COST_OF_SERVICE })

    @profit_by_month = [{ name: REVENUE, data: @revenue_by_month },
                        { name: COST_OF_SERVICE, data: @cost_of_service_by_month }]

    @transactions = @transactions.select(&:uncategorized?) if params[:category] == 'null'
    @uncategorized_transactions = @transactions.group_by(&:transaction_day)
  end


end
