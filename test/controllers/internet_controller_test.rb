require "test_helper"

class InternetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get internet_index_url
    assert_response :success
  end
end
