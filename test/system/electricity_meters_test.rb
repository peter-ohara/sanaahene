require "application_system_test_case"

class ElectricityMetersTest < ApplicationSystemTestCase
  setup do
    @electricity_meter = electricity_meters(:one)
  end

  test "visiting the index" do
    visit electricity_meters_url
    assert_selector "h1", text: "Electricity meters"
  end

  test "should create electricity meter" do
    visit electricity_meters_url
    click_on "New electricity meter"

    fill_in "Meter number", with: @electricity_meter.meter_number
    fill_in "Name", with: @electricity_meter.name
    fill_in "Reorder point", with: @electricity_meter.reorder_point
    click_on "Create Electricity meter"

    assert_text "Electricity meter was successfully created"
    click_on "Back"
  end

  test "should update Electricity meter" do
    visit electricity_meter_url(@electricity_meter)
    click_on "Edit this electricity meter", match: :first

    fill_in "Meter number", with: @electricity_meter.meter_number
    fill_in "Name", with: @electricity_meter.name
    fill_in "Reorder point", with: @electricity_meter.reorder_point
    click_on "Update Electricity meter"

    assert_text "Electricity meter was successfully updated"
    click_on "Back"
  end

  test "should destroy Electricity meter" do
    visit electricity_meter_url(@electricity_meter)
    click_on "Destroy this electricity meter", match: :first

    assert_text "Electricity meter was successfully destroyed"
  end
end
