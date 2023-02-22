require "application_system_test_case"

class UserSignOutTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @user.update!(password: "password")
    sign_in @user
  end

  test "user sign out" do
    visit root_url

    click_on :menu
    click_on "Sign out"

    # assert_text I18n.t("devise.sessions.signed_out")
    assert_text I18n.t("devise.failure.unauthenticated")
  end
end
