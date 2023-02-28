require "test_helper"

class CategorizeControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in create(:user)
  end
  test "should get index" do
    get categorize_index_url
    assert_response :success
  end
end
