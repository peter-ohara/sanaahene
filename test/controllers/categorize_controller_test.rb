require "test_helper"

class CategorizeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categorize_index_url
    assert_response :success
  end
end
