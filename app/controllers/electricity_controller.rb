class ElectricityController < ApplicationController
  def index
    @electricity_entries = ElectricityEntry.order(happened_at: :desc)
                                           .group_by(&:creation_date)


  end
end
