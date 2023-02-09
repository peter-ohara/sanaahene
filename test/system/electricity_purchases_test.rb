require "application_system_test_case"

class ElectricityPurchasesTest < ApplicationSystemTestCase
  setup do
    @electricity_purchase = inventory_entries(:one)
  end

  test "visiting the index" do
    skip("Will be moved into general Electricity test")
    visit electricity_purchases_url
    inventory_entries.each do |entry|
      assert_text entry.item.name
      assert_text "purchased (GHS #{entry.amount})"
    end
  end

  test "should create electricity purchase" do
    visit electricity_purchases_url
    click_on "add"

    select @electricity_purchase.attendee.name, from: "Attendee"
    fill_in "Happened at", with: @electricity_purchase.happened_at
    select @electricity_purchase.meter.name, from: "Meter"
    fill_in "Notes", with: @electricity_purchase.notes
    fill_in "Purchased amount", with: @electricity_purchase.purchased_amount
    click_on "Create Electricity purchase"

    assert_text "Electricity purchase was successfully created"
    click_on "arrow_back"
  end

  test "should update Electricity purchase" do
    visit electricity_purchase_url(@electricity_purchase)
    click_on "edit", match: :first

    select @electricity_purchase.attendee.name, from: "Attendee"
    fill_in "Happened at", with: @electricity_purchase.happened_at
    select @electricity_purchase.meter.name, from: "Meter"
    fill_in "Notes", with: @electricity_purchase.notes
    fill_in "Purchased amount", with: @electricity_purchase.purchased_amount
    click_on "Update Electricity purchase"

    assert_text "Electricity purchase was successfully updated"
    click_on "arrow_back"
  end

  test "should destroy Electricity purchase" do
    visit electricity_purchase_url(@electricity_purchase)
    accept_alert do
      click_on "delete", match: :first
    end

    assert_text "Electricity purchase was successfully destroyed"
  end
end
