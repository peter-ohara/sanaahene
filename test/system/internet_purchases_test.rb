require "application_system_test_case"

class InternetPurchasesTest < ApplicationSystemTestCase
  setup do
    sign_in create(:user)
    @internet_purchase = create(:internet_purchase)
  end

  test "visiting the index" do
    visit internet_index_url
    assert_text @internet_purchase.headline_text
  end

  test "should create internet purchase" do
    visit internet_index_url
    click_on "add_internet_purchase"

    fill_in "Amount", with: @internet_purchase.amount
    select @internet_purchase.attendee.name, from: "Attendee"
    fill_in "Happened at", with: @internet_purchase.happened_at
    select @internet_purchase.internet_account.name, from: "Internet account"
    fill_in "Notes", with: @internet_purchase.notes
    fill_in "Quantity", with: @internet_purchase.quantity
    click_on "Create Internet purchase"

    assert_text "Internet purchase was successfully created"
    click_on "arrow_back"
  end

  test "should update Internet purchase" do
    visit internet_purchase_url(@internet_purchase)
    click_on "edit", match: :first

    fill_in "Amount", with: @internet_purchase.amount
    select @internet_purchase.attendee.name, from: "Attendee"
    fill_in "Happened at", with: @internet_purchase.happened_at
    select @internet_purchase.internet_account.name, from: "Internet account"
    fill_in "Notes", with: @internet_purchase.notes
    fill_in "Quantity", with: @internet_purchase.quantity
    click_on "Update Internet purchase"

    assert_text "Internet purchase was successfully updated"
    click_on "arrow_back"
  end

  test "should destroy Internet purchase" do
    visit internet_purchase_url(@internet_purchase)
    accept_alert do
        click_on "delete", match: :first
    end

    assert_text "Internet purchase was successfully destroyed"
  end
end
