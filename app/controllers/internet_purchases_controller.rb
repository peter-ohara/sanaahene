class InternetPurchasesController < ApplicationController
  before_action :set_internet_purchase, only: %i[ show edit update destroy ]

  # GET /internet_purchases
  def index
    @internet_purchases = InternetPurchase.all
  end

  # GET /internet_purchases/1
  def show
  end

  # GET /internet_purchases/new
  def new
    @internet_purchase = InternetPurchase.new
  end

  # GET /internet_purchases/1/edit
  def edit
  end

  # POST /internet_purchases
  def create
    @internet_purchase = InternetPurchase.new(internet_purchase_params)

    if @internet_purchase.save
      redirect_to @internet_purchase, notice: "Internet purchase was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /internet_purchases/1
  def update
    if @internet_purchase.update(internet_purchase_params)
      redirect_to @internet_purchase, notice: "Internet purchase was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /internet_purchases/1
  def destroy
    @internet_purchase.destroy
    redirect_to internet_index_url, notice: "Internet purchase was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internet_purchase
      @internet_purchase = InternetPurchase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def internet_purchase_params
      params.require(:internet_purchase).permit(:happened_at, :internet_account_id, :amount, :quantity, :attendee_id, :notes)
    end
end
