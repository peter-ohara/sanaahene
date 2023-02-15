require "application_system_test_case"

class InternetBalancesTest < ApplicationSystemTestCase
  setup do
    @internet_balance = internet_entries(:three)
  end

  test "visiting the index" do
    visit internet_index_url
    [internet_entries(:three), internet_entries(:four)].each do |internet_balance|
      assert_text internet_balance.amount
    end
  end

  test "should create internet balance" do
    visit internet_index_url
    click_on "add_internet_balance"

    select @internet_balance.attendee.name, from: "Attendee"
    fill_in "Happened at", with: @internet_balance.happened_at
    select @internet_balance.internet_account.name, from: "Internet account"
    fill_in "Notes", with: @internet_balance.notes
    fill_in "Quantity", with: @internet_balance.quantity
    click_on "Create Internet balance"

    assert_text "Internet balance was successfully created"
    click_on "arrow_back"
  end

  test "should update Internet balance" do
    visit internet_balance_url(@internet_balance)
    click_on "edit", match: :first

    select @internet_balance.attendee.name, from: "Attendee"
    fill_in "Happened at", with: @internet_balance.happened_at
    select @internet_balance.internet_account.name, from: "Internet account"
    fill_in "Notes", with: @internet_balance.notes
    fill_in "Quantity", with: @internet_balance.quantity
    click_on "Update Internet balance"

    assert_text "Internet balance was successfully updated"
    click_on "arrow_back"
  end

  test "should destroy Internet balance" do
    visit internet_balance_url(@internet_balance)
    accept_alert do
        click_on "delete", match: :first
    end

    assert_text "Internet balance was successfully destroyed"
  end
end
