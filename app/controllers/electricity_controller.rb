class ElectricityController < ApplicationController
  def index
    @electricity_entries = ElectricityEntry.group_by_day
  end

  def usage_chart
    @start_date = chart_params[:start_date].to_date
    @end_date = chart_params[:end_date].to_date
    @period = chart_params[:period]

    @chart_data = ElectricityMeter.all.map do |meter|
      { name: meter.name, data: meter.usage_by_day(@start_date..@end_date) }
    end
  end

  private

  def chart_params
    params.permit(:start_date, :end_date, :period)
  end
end
