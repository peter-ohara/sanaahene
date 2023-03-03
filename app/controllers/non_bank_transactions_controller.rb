class NonBankTransactionsController < ApplicationController
  before_action :set_non_bank_transaction, only: %i[ show edit update destroy ]

  # GET /non_bank_transactions
  def index
    @non_bank_transactions = NonBankTransaction.group_by_day
  end

  # GET /non_bank_transactions/1
  def show
  end

  # GET /non_bank_transactions/new
  def new
    @non_bank_transaction = NonBankTransaction.new(transaction_date: Time.current)
  end

  # GET /non_bank_transactions/1/edit
  def edit
  end

  # POST /non_bank_transactions
  def create
    @non_bank_transaction = NonBankTransaction.new(non_bank_transaction_params)

    if @non_bank_transaction.save
      redirect_to @non_bank_transaction, notice: "Non bank transaction was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /non_bank_transactions/1
  def update
    if @non_bank_transaction.update(non_bank_transaction_params)
      redirect_to @non_bank_transaction, notice: "Non bank transaction was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /non_bank_transactions/1
  def destroy
    @non_bank_transaction.destroy
    redirect_to non_bank_transactions_url, notice: "Non bank transaction was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_non_bank_transaction
      @non_bank_transaction = NonBankTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def non_bank_transaction_params
      params.require(:non_bank_transaction).permit(:transaction_date, :transaction_type, :counter_party, :ref, :amount, :fees, :e_levy, :category_id, :notes)
    end
end
