class ElectricityPurchasesController < ApplicationController
  before_action :set_electricity_purchase, only: %i[ show edit update destroy ]

  # GET /electricity_purchases/1
  def show
  end

  # GET /electricity_purchases/new
  def new
    @electricity_purchase = ElectricityPurchase.new(happened_at: Time.zone.now)
  end

  # GET /electricity_purchases/1/edit
  def edit
  end

  # POST /electricity_purchases
  def create
    @electricity_purchase = ElectricityPurchase.new(electricity_purchase_params)

    if @electricity_purchase.save
      redirect_to @electricity_purchase, notice: "Electricity purchase was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /electricity_purchases/1
  def update
    if @electricity_purchase.update(electricity_purchase_params)
      redirect_to @electricity_purchase, notice: "Electricity purchase was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /electricity_purchases/1
  def destroy
    @electricity_purchase.destroy
    redirect_to electricity_index_url, notice: "Electricity purchase was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_electricity_purchase
      @electricity_purchase = ElectricityPurchase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def electricity_purchase_params
      params.require(:electricity_purchase).permit(:happened_at, :meter_id, :purchased_amount, :attendee_id, :notes)
    end
end
