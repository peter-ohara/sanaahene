class CategorizeController < ApplicationController
  def index
    @transactions = (MomoImportLine.all + EcobankImportLine.all).sort_by { |tx| [tx.transaction_date, tx.created_at] }
  end
end
