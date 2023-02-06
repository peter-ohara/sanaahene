require "application_system_test_case"

class InventoryEntriesTest < ApplicationSystemTestCase
  setup do
    @inventory_entry = inventory_entries(:one)
  end

  test "visiting the index" do
    visit inventory_entries_url
    assert_selector "h1", text: "Inventory entries"
  end

  test "should create inventory entry" do
    visit inventory_entries_url
    click_on "New inventory entry"

    fill_in "Amount", with: @inventory_entry.amount
    fill_in "Attendee", with: @inventory_entry.attendee_id
    fill_in "Happened at", with: @inventory_entry.happened_at
    fill_in "Item", with: @inventory_entry.item_id
    fill_in "Notes", with: @inventory_entry.notes
    fill_in "Quantity", with: @inventory_entry.quantity
    fill_in "Type", with: @inventory_entry.type
    click_on "Create Inventory entry"

    assert_text "Inventory entry was successfully created"
    click_on "Back"
  end

  test "should update Inventory entry" do
    visit inventory_entry_url(@inventory_entry)
    click_on "Edit this inventory entry", match: :first

    fill_in "Amount", with: @inventory_entry.amount
    fill_in "Attendee", with: @inventory_entry.attendee_id
    fill_in "Happened at", with: @inventory_entry.happened_at
    fill_in "Item", with: @inventory_entry.item_id
    fill_in "Notes", with: @inventory_entry.notes
    fill_in "Quantity", with: @inventory_entry.quantity
    fill_in "Type", with: @inventory_entry.type
    click_on "Update Inventory entry"

    assert_text "Inventory entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Inventory entry" do
    visit inventory_entry_url(@inventory_entry)
    click_on "Destroy this inventory entry", match: :first

    assert_text "Inventory entry was successfully destroyed"
  end
end
