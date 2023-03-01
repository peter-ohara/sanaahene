# frozen_string_literal: true

class CategorizeController < ApplicationController
  def index
    @transactions = MomoImportLine.all + EcobankImportLine.all + BinanceImportLine.all
    # @transactions = BinanceImportLine.all
    @transactions = @transactions.sort_by { |tx| [tx.transaction_date, tx.created_at] }#.filter {|tx| not(tx.received?) }
  end
end
