require "application_system_test_case"

class UserSignInTest < ApplicationSystemTestCase
  setup do
    @user = create(:user)
    @user.update!(password: "password")
  end

  test "user sign in with email" do
    visit root_url

    assert_text I18n.t("devise.failure.unauthenticated")

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_on "Log in"

    assert_text I18n.t("devise.sessions.signed_in")
  end
end
