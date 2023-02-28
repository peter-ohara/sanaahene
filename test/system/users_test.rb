require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    sign_in create(:user)
    @user = create(:user)
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

    fill_in "First name", with: @user.first_name
    fill_in "Last name", with: @user.last_name
    fill_in "Other names", with: @user.other_names
    fill_in "Phone number", with: "+233987456789"
    fill_in "Email", with: "gob3@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "arrow_back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "edit", match: :first

    fill_in "First name", with: @user.first_name
    fill_in "Last name", with: @user.last_name
    fill_in "Other names", with: @user.other_names
    fill_in "Phone number", with: @user.phone_number
    fill_in "Email", with: "gob3@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
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
