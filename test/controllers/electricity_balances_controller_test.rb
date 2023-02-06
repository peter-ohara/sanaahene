require "test_helper"

class ElectricityBalancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @electricity_balance = inventory_entries(:three)
  end

  test "should get index" do
    get electricity_balances_url
    assert_response :success
  end

  test "should get new" do
    get new_electricity_balance_url
    assert_response :success
  end

  test "should create electricity_balance" do
    assert_difference("ElectricityBalance.count") do
      post electricity_balances_url, params: { electricity_balance: { attendee_id: @electricity_balance.attendee_id, happened_at: @electricity_balance.happened_at, meter: @electricity_balance.meter, meter_balance: @electricity_balance.meter_balance, notes: @electricity_balance.notes } }
    end

    assert_redirected_to electricity_balance_url(ElectricityBalance.last)
  end

  test "should show electricity_balance" do
    get electricity_balance_url(@electricity_balance)
    assert_response :success
  end

  test "should get edit" do
    get edit_electricity_balance_url(@electricity_balance)
    assert_response :success
  end

  test "should update electricity_balance" do
    patch electricity_balance_url(@electricity_balance), params: { electricity_balance: { attendee_id: @electricity_balance.attendee_id, happened_at: @electricity_balance.happened_at, meter: @electricity_balance.meter, meter_balance: @electricity_balance.meter_balance, notes: @electricity_balance.notes } }
    assert_redirected_to electricity_balance_url(@electricity_balance)
  end

  test "should destroy electricity_balance" do
    assert_difference("ElectricityBalance.count", -1) do
      delete electricity_balance_url(@electricity_balance)
    end

    assert_redirected_to electricity_balances_url
  end
end
