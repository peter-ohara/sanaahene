class ElectricityBalancesController < ApplicationController
  before_action :set_electricity_balance, only: %i[ show edit update destroy ]

  # GET /electricity_balances
  def index
    @electricity_balances = ElectricityBalance.all
  end

  # GET /electricity_balances/1
  def show
  end

  # GET /electricity_balances/new
  def new
    @electricity_balance = ElectricityBalance.new(happened_at: Time.zone.now)
  end

  # GET /electricity_balances/1/edit
  def edit
  end

  # POST /electricity_balances
  def create
    @electricity_balance = ElectricityBalance.new(electricity_balance_params)

    if @electricity_balance.save
      redirect_to @electricity_balance, notice: "Electricity balance was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /electricity_balances/1
  def update
    if @electricity_balance.update(electricity_balance_params)
      redirect_to @electricity_balance, notice: "Electricity balance was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /electricity_balances/1
  def destroy
    @electricity_balance.destroy
    redirect_to electricity_balances_url, notice: "Electricity balance was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_electricity_balance
      @electricity_balance = ElectricityBalance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def electricity_balance_params
      params.require(:electricity_balance).permit(:happened_at, :meter, :meter_balance, :attendee_id, :notes)
    end
end
