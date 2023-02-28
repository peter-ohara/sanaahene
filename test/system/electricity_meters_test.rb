require "application_system_test_case"

class ElectricityMetersTest < ApplicationSystemTestCase
  setup do
    sign_in create(:user)
    @electricity_meter = create(:electricity_meter)
  end

  test "visiting the index" do
    visit electricity_meters_url
    assert_text @electricity_meter.name
  end

  test "should create electricity meter" do
    visit electricity_meters_url
    click_on "add"

    fill_in "Meter number", with: "P123467"
    fill_in "Name", with: "Cantoments"
    fill_in "Reorder point", with: @electricity_meter.reorder_point
    click_on "Create Electricity meter"

    assert_text "Electricity meter was successfully created"
    click_on "arrow_back"
  end

  test "should update Electricity meter" do
    visit electricity_meter_url(@electricity_meter)
    click_on "edit", match: :first

    fill_in "Meter number", with: @electricity_meter.meter_number
    fill_in "Name", with: @electricity_meter.name
    fill_in "Reorder point", with: @electricity_meter.reorder_point
    click_on "Update Electricity meter"

    assert_text "Electricity meter was successfully updated"
    click_on "arrow_back"
  end

end
