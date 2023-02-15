require "test_helper"

class InternetPurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @internet_purchase = internet_entries(:one)
  end

  test "should get index" do
    get internet_index_url
    assert_response :success
  end

  test "should get new" do
    get new_internet_purchase_url
    assert_response :success
  end

  test "should create internet_purchase" do
    assert_difference("InternetPurchase.count") do
      post internet_purchases_url, params: { internet_purchase: { amount: @internet_purchase.amount, attendee_id: @internet_purchase.attendee_id, happened_at: @internet_purchase.happened_at, internet_account_id: @internet_purchase.internet_account_id, notes: @internet_purchase.notes, quantity: @internet_purchase.quantity } }
    end

    assert_redirected_to internet_purchase_url(InternetPurchase.last)
  end

  test "should show internet_purchase" do
    get internet_purchase_url(@internet_purchase)
    assert_response :success
  end

  test "should get edit" do
    get edit_internet_purchase_url(@internet_purchase)
    assert_response :success
  end

  test "should update internet_purchase" do
    patch internet_purchase_url(@internet_purchase), params: { internet_purchase: { amount: @internet_purchase.amount, attendee_id: @internet_purchase.attendee_id, happened_at: @internet_purchase.happened_at, internet_account_id: @internet_purchase.internet_account_id, notes: @internet_purchase.notes, quantity: @internet_purchase.quantity } }
    assert_redirected_to internet_purchase_url(@internet_purchase)
  end

  test "should destroy internet_purchase" do
    assert_difference("InternetPurchase.count", -1) do
      delete internet_purchase_url(@internet_purchase)
    end

    assert_redirected_to internet_index_url
  end
end
