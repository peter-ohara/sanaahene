require "test_helper"

class ElectricityControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get electricity_index_url
    assert_response :success
  end
end
