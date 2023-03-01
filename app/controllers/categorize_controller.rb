# frozen_string_literal: true

class CategorizeController < ApplicationController
  def index
    @transactions = MomoImportLine.all + EcobankImportLine.all + BinanceImportLine.all
    # @transactions = BinanceImportLine.all
    @transactions = @transactions.sort_by { |tx| [tx.transaction_date, tx.created_at] }
    # @transactions = @transactions.filter {|tx| not(tx.received?) }
  end

  def deck
    @transactions = MomoImportLine.all + EcobankImportLine.all + BinanceImportLine.all
    @transactions = @transactions.sort_by { |tx| [tx.transaction_date, tx.created_at] }
                                 .group_by(&:transaction_day)
  end
end
