class InternetBalancesController < ApplicationController
  before_action :set_internet_balance, only: %i[ show edit update destroy ]

  # GET /internet_balances
  def index
    @internet_balances = InternetBalance.all
  end

  # GET /internet_balances/1
  def show
  end

  # GET /internet_balances/new
  def new
    @internet_balance = InternetBalance.new
  end

  # GET /internet_balances/1/edit
  def edit
  end

  # POST /internet_balances
  def create
    @internet_balance = InternetBalance.new(internet_balance_params)

    if @internet_balance.save
      redirect_to @internet_balance, notice: "Internet balance was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /internet_balances/1
  def update
    if @internet_balance.update(internet_balance_params)
      redirect_to @internet_balance, notice: "Internet balance was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /internet_balances/1
  def destroy
    @internet_balance.destroy
    redirect_to internet_index_url, notice: "Internet balance was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internet_balance
      @internet_balance = InternetBalance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def internet_balance_params
      params.require(:internet_balance).permit(:happened_at, :internet_account_id, :quantity, :attendee_id, :notes)
    end
end
