require "test_helper"

class ElectricityPurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @electricity_purchase = create(:electricity_purchase)
  end

  test "should get index" do
    get electricity_index_url
    assert_response :success
  end

  test "should get new" do
    get new_electricity_purchase_url
    assert_response :success
  end

  test "should create electricity_purchase" do
    assert_difference("ElectricityPurchase.count") do
      post electricity_purchases_url, params: { electricity_purchase: { attendee_id: @electricity_purchase.attendee_id, happened_at: @electricity_purchase.happened_at, meter_id: @electricity_purchase.meter_id, notes: @electricity_purchase.notes, purchased_amount: @electricity_purchase.purchased_amount } }
    end

    assert_redirected_to electricity_purchase_url(ElectricityPurchase.last)
  end

  test "should show electricity_purchase" do
    get electricity_purchase_url(@electricity_purchase)
    assert_response :success
  end

  test "should get edit" do
    get edit_electricity_purchase_url(@electricity_purchase)
    assert_response :success
  end

  test "should update electricity_purchase" do
    patch electricity_purchase_url(@electricity_purchase), params: { electricity_purchase: { attendee_id: @electricity_purchase.attendee_id, happened_at: @electricity_purchase.happened_at, meter_id: @electricity_purchase.meter_id, notes: @electricity_purchase.notes, purchased_amount: @electricity_purchase.purchased_amount } }
    assert_redirected_to electricity_purchase_url(@electricity_purchase)
  end

  test "should destroy electricity_purchase" do
    assert_difference("ElectricityPurchase.count", -1) do
      delete electricity_purchase_url(@electricity_purchase)
    end

    assert_redirected_to electricity_index_url
  end
end
