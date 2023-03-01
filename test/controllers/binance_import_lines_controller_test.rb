require "test_helper"

class BinanceImportLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in create(:user)
    @binance_import_line = create(:binance_import_line)
  end

  test "should get index" do
    get binance_import_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_binance_import_line_url
    assert_response :success
  end

  test "should create binance_import_line" do
    assert_difference("BinanceImportLine.count") do
      post binance_import_lines_url, params: { binance_import_line: { asset_type: @binance_import_line.asset_type, couterparty: @binance_import_line.couterparty, created_time: @binance_import_line.created_time, exchange_rate: @binance_import_line.exchange_rate, fiat_type: @binance_import_line.fiat_type, order_number: @binance_import_line.order_number, order_type: @binance_import_line.order_type, price: @binance_import_line.price, quantity: @binance_import_line.quantity, status: @binance_import_line.status, total_price: @binance_import_line.total_price } }
    end

    assert_redirected_to binance_import_line_url(BinanceImportLine.last)
  end

  test "should show binance_import_line" do
    get binance_import_line_url(@binance_import_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_binance_import_line_url(@binance_import_line)
    assert_response :success
  end

  test "should update binance_import_line" do
    patch binance_import_line_url(@binance_import_line), params: { binance_import_line: { asset_type: @binance_import_line.asset_type, couterparty: @binance_import_line.couterparty, created_time: @binance_import_line.created_time, exchange_rate: @binance_import_line.exchange_rate, fiat_type: @binance_import_line.fiat_type, order_number: @binance_import_line.order_number, order_type: @binance_import_line.order_type, price: @binance_import_line.price, quantity: @binance_import_line.quantity, status: @binance_import_line.status, total_price: @binance_import_line.total_price } }
    assert_redirected_to binance_import_line_url(@binance_import_line)
  end

  test "should destroy binance_import_line" do
    assert_difference("BinanceImportLine.count", -1) do
      delete binance_import_line_url(@binance_import_line)
    end

    assert_redirected_to binance_import_lines_url
  end
end
