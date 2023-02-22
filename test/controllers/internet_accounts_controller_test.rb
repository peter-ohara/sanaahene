require "test_helper"

class InternetAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @internet_account = internet_accounts(:one)
  end

  test "should get index" do
    get internet_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_internet_account_url
    assert_response :success
  end

  test "should create internet_account" do
    assert_difference("InternetAccount.count") do
      post internet_accounts_url, params: { internet_account: { account_number: @internet_account.account_number, name: "Ghana Wifi Tina's Court", phone_number: @internet_account.phone_number, reorder_point: @internet_account.reorder_point, service_name: @internet_account.service_name, usage_type: @internet_account.usage_type } }
    end

    assert_redirected_to internet_account_url(InternetAccount.last)
  end

  test "should show internet_account" do
    get internet_account_url(@internet_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_internet_account_url(@internet_account)
    assert_response :success
  end

  test "should update internet_account" do
    patch internet_account_url(@internet_account), params: { internet_account: { account_number: @internet_account.account_number, name: @internet_account.name, phone_number: @internet_account.phone_number, reorder_point: @internet_account.reorder_point, service_name: @internet_account.service_name, usage_type: @internet_account.usage_type } }
    assert_redirected_to internet_account_url(@internet_account)
  end

  test "should destroy internet_account" do
    assert_difference("InternetAccount.count", -1) do
      delete internet_account_url(@internet_account)
    end

    assert_redirected_to internet_accounts_url
  end
end
