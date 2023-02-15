class ElectricityController < ApplicationController
  def index
    @electricity_entries = InventoryEntry.order(happened_at: :desc)
                                         .group_by(&:creation_date)


  end
end
