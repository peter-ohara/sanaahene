require "test_helper"

class InternetBalancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @internet_balance = create(:internet_balance)
  end

  test "should get index" do
    get internet_index_url
    assert_response :success
  end

  test "should get new" do
    get new_internet_balance_url
    assert_response :success
  end

  test "should create internet_balance" do
    assert_difference("InternetBalance.count") do
      post internet_balances_url, params: { internet_balance: { attendee_id: @internet_balance.attendee_id, happened_at: @internet_balance.happened_at, internet_account_id: @internet_balance.internet_account_id, notes: @internet_balance.notes, quantity: @internet_balance.quantity } }
    end

    assert_redirected_to internet_balance_url(InternetBalance.last)
  end

  test "should show internet_balance" do
    get internet_balance_url(@internet_balance)
    assert_response :success
  end

  test "should get edit" do
    get edit_internet_balance_url(@internet_balance)
    assert_response :success
  end

  test "should update internet_balance" do
    patch internet_balance_url(@internet_balance), params: { internet_balance: { attendee_id: @internet_balance.attendee_id, happened_at: @internet_balance.happened_at, internet_account_id: @internet_balance.internet_account_id, notes: @internet_balance.notes, quantity: @internet_balance.quantity } }
    assert_redirected_to internet_balance_url(@internet_balance)
  end

  test "should destroy internet_balance" do
    assert_difference("InternetBalance.count", -1) do
      delete internet_balance_url(@internet_balance)
    end

    assert_redirected_to internet_index_url
  end
end
