class InternetAccountsController < ApplicationController
  before_action :set_internet_account, only: %i[ show edit update destroy ]

  # GET /internet_accounts
  def index
    @internet_accounts = InternetAccount.all
  end

  # GET /internet_accounts/1
  def show
  end

  # GET /internet_accounts/new
  def new
    @internet_account = InternetAccount.new
  end

  # GET /internet_accounts/1/edit
  def edit
  end

  # POST /internet_accounts
  def create
    @internet_account = InternetAccount.new(internet_account_params)

    if @internet_account.save
      redirect_to @internet_account, notice: "Internet account was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /internet_accounts/1
  def update
    if @internet_account.update(internet_account_params)
      redirect_to @internet_account, notice: "Internet account was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /internet_accounts/1
  def destroy
    @internet_account.destroy
    redirect_to internet_accounts_url, notice: "Internet account was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internet_account
      @internet_account = InternetAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def internet_account_params
      params.require(:internet_account).permit(:name, :usage_type, :account_number, :phone_number, :service_name, :reorder_point)
    end
end
