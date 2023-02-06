class ElectricityController < ApplicationController
  def index
    @electricity_purchases = InventoryEntry.where(type: ['ElectricityPurchase', "ElectricityBalance"] )
  end
end
