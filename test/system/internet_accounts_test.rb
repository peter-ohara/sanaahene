require "application_system_test_case"

class InternetAccountsTest < ApplicationSystemTestCase
  setup do
    @internet_account = internet_accounts(:one)
  end

  test "visiting the index" do
    visit internet_accounts_url
    assert_selector "h1", text: "Internet accounts"
  end

  test "should create internet account" do
    visit internet_accounts_url
    click_on "New internet account"

    fill_in "Account number", with: @internet_account.account_number
    fill_in "Name", with: @internet_account.name
    fill_in "Phone number", with: @internet_account.phone_number
    fill_in "Reorder point", with: @internet_account.reorder_point
    fill_in "Service name", with: @internet_account.service_name
    fill_in "Usage type", with: @internet_account.usage_type
    click_on "Create Internet account"

    assert_text "Internet account was successfully created"
    click_on "Back"
  end

  test "should update Internet account" do
    visit internet_account_url(@internet_account)
    click_on "Edit this internet account", match: :first

    fill_in "Account number", with: @internet_account.account_number
    fill_in "Name", with: @internet_account.name
    fill_in "Phone number", with: @internet_account.phone_number
    fill_in "Reorder point", with: @internet_account.reorder_point
    fill_in "Service name", with: @internet_account.service_name
    fill_in "Usage type", with: @internet_account.usage_type
    click_on "Update Internet account"

    assert_text "Internet account was successfully updated"
    click_on "Back"
  end

  test "should destroy Internet account" do
    visit internet_account_url(@internet_account)
    click_on "Destroy this internet account", match: :first

    assert_text "Internet account was successfully destroyed"
  end
end
