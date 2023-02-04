require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    items.each do |item|
      assert_text item.name
    end
  end

  test "should create item" do
    visit items_url
    click_on "add"

    fill_in "Name", with: "Bleach"
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "arrow_back"
  end

  test "should update Item" do
    visit item_url(@item)
    click_on "edit", match: :first

    fill_in "Name", with: @item.name
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "arrow_back"
  end

  test "should destroy Item" do
    visit item_url(@item)
    accept_alert do
      click_on "delete", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
