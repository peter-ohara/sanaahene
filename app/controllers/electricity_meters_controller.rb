class ElectricityMetersController < ApplicationController
  before_action :set_electricity_meter, only: %i[ show edit update destroy ]

  # GET /electricity_meters
  def index
    @electricity_meters = ElectricityMeter.all
  end

  # GET /electricity_meters/1
  def show
  end

  # GET /electricity_meters/new
  def new
    @electricity_meter = ElectricityMeter.new
  end

  # GET /electricity_meters/1/edit
  def edit
  end

  # POST /electricity_meters
  def create
    @electricity_meter = ElectricityMeter.new(electricity_meter_params)

    if @electricity_meter.save
      redirect_to @electricity_meter, notice: "Electricity meter was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /electricity_meters/1
  def update
    if @electricity_meter.update(electricity_meter_params)
      redirect_to @electricity_meter, notice: "Electricity meter was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /electricity_meters/1
  def destroy
    @electricity_meter.destroy
    redirect_to electricity_meters_url, notice: "Electricity meter was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_electricity_meter
      @electricity_meter = ElectricityMeter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def electricity_meter_params
      params.require(:electricity_meter).permit(:name, :meter_number, :reorder_point)
    end
end
