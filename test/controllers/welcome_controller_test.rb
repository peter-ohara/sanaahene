require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in create(:user)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end
end
