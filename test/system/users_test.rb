require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    users.each do |user|
      assert_text user.name
    end
  end

  test "should create user" do
    visit users_url
    click_on "add"

    fill_in "Email", with: "gob3@gmail.com"
    fill_in "First name", with: @user.first_name
    fill_in "Last name", with: @user.last_name
    fill_in "Other names", with: @user.other_names
    fill_in "Phone number", with: "+233987456789"
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "arrow_back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "edit", match: :first

    fill_in "Email", with: @user.email
    fill_in "First name", with: @user.first_name
    fill_in "Last name", with: @user.last_name
    fill_in "Other names", with: @user.other_names
    fill_in "Phone number", with: @user.phone_number
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "arrow_back"
  end

  test "should destroy User" do
    visit user_url(@user)
    accept_alert do
      click_on "delete", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
