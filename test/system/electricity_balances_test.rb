require "application_system_test_case"

class ElectricityBalancesTest < ApplicationSystemTestCase
  setup do
    @electricity_balance = inventory_entries(:three)
  end

  test "visiting the index" do
    skip("Will be moved into general Electricity test")
    visit electricity_balances_url
    assert_selector "h1", text: "Electricity balances"
  end

  test "should create electricity balance" do
    visit electricity_balances_url
    click_on "add"

    select @electricity_balance.attendee.name, from: "Attendee"
    fill_in "Happened at", with: @electricity_balance.happened_at
    select @electricity_balance.meter.name, from: "Meter"
    fill_in "Meter balance", with: @electricity_balance.meter_balance
    fill_in "Notes", with: @electricity_balance.notes
    click_on "Create Electricity balance"

    assert_text "Electricity balance was successfully created"
    click_on "arrow_back"
  end

  test "should update Electricity balance" do
    visit electricity_balance_url(@electricity_balance)
    click_on "edit", match: :first

    select @electricity_balance.attendee.name, from: "Attendee"
    fill_in "Happened at", with: @electricity_balance.happened_at
    fill_in "Meter", with: @electricity_balance.meter
    fill_in "Meter balance", with: @electricity_balance.meter_balance
    fill_in "Notes", with: @electricity_balance.notes
    click_on "Update Electricity balance"

    assert_text "Electricity balance was successfully updated"
    click_on "arrow_back"
  end

  test "should destroy Electricity balance" do
    visit electricity_balance_url(@electricity_balance)
    accept_alert do
      click_on "delete", match: :first
    end

    assert_text "Electricity balance was successfully destroyed"
  end
end
