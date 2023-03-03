require "test_helper"

class NonBankTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in create(:user)
    @non_bank_transaction = create(:non_bank_transaction)
  end

  test "should get index" do
    get non_bank_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_non_bank_transaction_url
    assert_response :success
  end

  test "should create non_bank_transaction" do
    assert_difference("NonBankTransaction.count") do
      post non_bank_transactions_url, params: { non_bank_transaction: { amount: @non_bank_transaction.amount, category_id: @non_bank_transaction.category_id, counter_party: @non_bank_transaction.counter_party, e_levy: @non_bank_transaction.e_levy, fees: @non_bank_transaction.fees, notes: @non_bank_transaction.notes, ref: @non_bank_transaction.ref, transaction_date: @non_bank_transaction.transaction_date, transaction_type: @non_bank_transaction.transaction_type } }
    end

    assert_redirected_to non_bank_transaction_url(NonBankTransaction.last)
  end

  test "should show non_bank_transaction" do
    get non_bank_transaction_url(@non_bank_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_non_bank_transaction_url(@non_bank_transaction)
    assert_response :success
  end

  test "should update non_bank_transaction" do
    patch non_bank_transaction_url(@non_bank_transaction), params: { non_bank_transaction: { amount: @non_bank_transaction.amount, category_id: @non_bank_transaction.category_id, counter_party: @non_bank_transaction.counter_party, e_levy: @non_bank_transaction.e_levy, fees: @non_bank_transaction.fees, notes: @non_bank_transaction.notes, ref: @non_bank_transaction.ref, transaction_date: @non_bank_transaction.transaction_date, transaction_type: @non_bank_transaction.transaction_type } }
    assert_redirected_to non_bank_transaction_url(@non_bank_transaction)
  end

  test "should destroy non_bank_transaction" do
    assert_difference("NonBankTransaction.count", -1) do
      delete non_bank_transaction_url(@non_bank_transaction)
    end

    assert_redirected_to non_bank_transactions_url
  end
end
