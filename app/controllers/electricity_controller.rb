class ElectricityController < ApplicationController
  def index
    @electricity_purchases = InventoryEntry.where(type: ['ElectricityPurchase', "ElectricityBalance"])
                                           .order(happened_at: :desc)
                                           .group_by(&:creation_date)


  end
end
