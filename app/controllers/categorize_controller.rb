class CategorizeController < ApplicationController
  def index
    @transactions = MomoImportLine.all
  end
end
