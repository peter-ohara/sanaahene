require "test_helper"

class ElectricityControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get electricity_entries_path
    assert_response :success
  end
end
