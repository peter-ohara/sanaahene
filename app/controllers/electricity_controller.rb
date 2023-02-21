class ElectricityController < ApplicationController
  def index
    @electricity_entries = ElectricityEntry.order(happened_at: :desc)
                                           .group_by(&:entry_date)


  end
end
