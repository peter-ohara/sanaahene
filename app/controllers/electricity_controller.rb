class ElectricityController < ApplicationController
  def index
    @electricity_entries = ElectricityEntry.grouped_by_day
  end
end
