require "application_system_test_case"

class ElectricityPurchasesTest < ApplicationSystemTestCase
  setup do
    sign_in create(:user)
    @electricity_purchase = create(:electricity_purchase)
  end

  test "visiting the index" do
    visit electricity_index_url
    assert_text @electricity_purchase.headline_text
  end

  test "should create electricity purchase" do
    visit electricity_index_url
    click_on "add_electricity_purchase"

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
