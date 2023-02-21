class ElectricityController < ApplicationController
  def index
    @electricity_entries = ElectricityEntry.group_by_day
  end
end
