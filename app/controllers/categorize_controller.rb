# frozen_string_literal: true

class CategorizeController < ApplicationController
  def index
    @transactions = MomoImportLine.all + EcobankImportLine.all + BinanceImportLine.all
    @transactions = @transactions.sort_by(&:sort_order).reverse
  end

  def deck
    @transactions = MomoImportLine.all + EcobankImportLine.all

    @sum_txs_by_account_type = @transactions.group_by(&:account_type).map { |at, txs| [at, txs.sum(&:delta)] }
    @count_txs_by_category = @transactions.group_by(&:category_name).map { |c, txs| [c, txs.count] }

    @transactions_by_day = @transactions.sort_by(&:sort_order).reverse.group_by(&:transaction_day)
  end
end
