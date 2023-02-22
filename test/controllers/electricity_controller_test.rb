require "test_helper"

class ElectricityControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "should get index" do
    get electricity_index_path
    assert_response :success
  end
end
