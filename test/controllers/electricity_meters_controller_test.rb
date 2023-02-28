require "test_helper"

class ElectricityMetersControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @electricity_meter = create(:electricity_meter)
  end

  test "should get index" do
    get electricity_meters_url
    assert_response :success
  end

  test "should get new" do
    get new_electricity_meter_url
    assert_response :success
  end

  test "should create electricity_meter" do
    assert_difference("ElectricityMeter.count") do
      post electricity_meters_url, params: { electricity_meter: { meter_number: "P171010831", name: "Cantonments", reorder_point: @electricity_meter.reorder_point } }
    end

    assert_redirected_to electricity_meter_url(ElectricityMeter.last)
  end

  test "should show electricity_meter" do
    get electricity_meter_url(@electricity_meter)
    assert_response :success
  end

  test "should get edit" do
    get edit_electricity_meter_url(@electricity_meter)
    assert_response :success
  end

  test "should update electricity_meter" do
    patch electricity_meter_url(@electricity_meter), params: { electricity_meter: { meter_number: @electricity_meter.meter_number, name: @electricity_meter.name, reorder_point: @electricity_meter.reorder_point } }
    assert_redirected_to electricity_meter_url(@electricity_meter)
  end

  test "should destroy electricity_meter" do
    assert_difference("ElectricityMeter.count", -1) do
      delete electricity_meter_url(@electricity_meter)
    end

    assert_redirected_to electricity_meters_url
  end
end
