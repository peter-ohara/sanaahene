require "application_system_test_case"

class InventoryEntriesTest < ApplicationSystemTestCase
  setup do
    @inventory_entry = inventory_entries(:one)
  end

  test "visiting the index" do
    skip("Will be moved into general Electricity test")
    visit inventory_entries_url
    assert_selector "h1", text: "Inventory entries"
  end

  test "should create inventory entry" do
    skip("Will be moved into general Electricity test")
    visit inventory_entries_url
    click_on "add"

    fill_in "Amount", with: @inventory_entry.amount
    select @inventory_entry.attendee.name, from: "Attendee"
    fill_in "Happened at", with: @inventory_entry.happened_at
    select @inventory_entry.item.name, from: "Item"
    fill_in "Notes", with: @inventory_entry.notes
    fill_in "Quantity", with: @inventory_entry.quantity
    fill_in "Type", with: @inventory_entry.type
    click_on "Create Inventory entry"

    assert_text "Inventory entry was successfully created"
    click_on "arrow_back"
  end

  test "should update Inventory entry" do
    visit inventory_entry_url(@inventory_entry)
    click_on "edit", match: :first

    fill_in "Amount", with: @inventory_entry.amount
    select @inventory_entry.attendee.name, from: "Attendee"
    fill_in "Happened at", with: @inventory_entry.happened_at
    select @inventory_entry.item.name, from: "Item"
    fill_in "Notes", with: @inventory_entry.notes
    fill_in "Quantity", with: @inventory_entry.quantity
    fill_in "Type", with: @inventory_entry.type
    click_on "Update Electricity purchase"

    assert_text "Electricity purchase was successfully updated"
    click_on "arrow_back"
  end

  test "should destroy Inventory entry" do
    visit inventory_entry_url(@inventory_entry)

    accept_alert do
      click_on "delete", match: :first
    end

    assert_text "Electricity purchase was successfully destroyed"
  end
end
