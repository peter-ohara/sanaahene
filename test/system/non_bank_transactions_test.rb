require "application_system_test_case"

class NonBankTransactionsTest < ApplicationSystemTestCase
  setup do
    sign_in create(:user)
    @non_bank_transaction = create(:non_bank_transaction)
  end

  test "visiting the index" do
    visit non_bank_transactions_url
    assert_text @non_bank_transaction.headline_text
  end

  test "should create non bank transaction" do
    visit non_bank_transactions_url
    click_on "add"

    fill_in "Amount", with: @non_bank_transaction.amount
    # fill_in "Category", with: @non_bank_transaction.category_id
    fill_in "Counter party", with: @non_bank_transaction.counter_party
    fill_in "E levy", with: @non_bank_transaction.e_levy
    fill_in "Fees", with: @non_bank_transaction.fees
    fill_in "Notes", with: @non_bank_transaction.notes
    fill_in "Ref", with: @non_bank_transaction.ref
    # fill_in "Transaction date", with: @non_bank_transaction.transaction_date
    # fill_in "Transaction type", with: @non_bank_transaction.transaction_type
    click_on "Create Non bank transaction"

    assert_text "Non bank transaction was successfully created"
    click_on "arrow_back"
  end

  test "should update Non bank transaction" do
    visit non_bank_transaction_url(@non_bank_transaction)
    click_on "edit", match: :first

    fill_in "Amount", with: @non_bank_transaction.amount
    # fill_in "Category", with: @non_bank_transaction.category_id
    fill_in "Counter party", with: @non_bank_transaction.counter_party
    fill_in "E levy", with: @non_bank_transaction.e_levy
    fill_in "Fees", with: @non_bank_transaction.fees
    fill_in "Notes", with: @non_bank_transaction.notes
    fill_in "Ref", with: @non_bank_transaction.ref
    # fill_in "Transaction date", with: @non_bank_transaction.transaction_date
    # fill_in "Transaction type", with: @non_bank_transaction.transaction_type
    click_on "Update Non bank transaction"

    assert_text "Non bank transaction was successfully updated"
    click_on "arrow_back"
  end

  test "should destroy Non bank transaction" do
    visit non_bank_transaction_url(@non_bank_transaction)
    accept_alert do
        click_on "delete", match: :first
    end

    assert_text "Non bank transaction was successfully destroyed"
  end
end
