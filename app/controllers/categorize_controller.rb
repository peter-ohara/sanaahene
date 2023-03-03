# frozen_string_literal: true

class CategorizeController < ApplicationController
  def index
    @transactions = MomoImportLine.cedi_transactions + EcobankImportLine.all + BinanceImportLine.all
    @transactions = @transactions.sort_by(&:sort_order)
  end

  def deck
    @transactions = BinanceImportLine.cedi_transactions + MomoImportLine.all + EcobankImportLine.all

    @sum_txs_by_account_type = @transactions.group_by(&:account_type).map { |at, txs| [at, txs.sum(&:delta)] }
    @count_txs_by_category = @transactions.group_by(&:category_name).map { |c, txs| [c, txs.count] }

    if params[:category] == 'null'
      @transactions = @transactions.select(&:uncategorized?)
    elsif Category.all.map(&:name).include?(params[:category])
      @transactions = @transactions.select { |tx| tx.category_name == params[:category] }
    end
    @uncategorized_transactions = @transactions.sort_by(&:sort_order).group_by(&:transaction_day)
  end
end
