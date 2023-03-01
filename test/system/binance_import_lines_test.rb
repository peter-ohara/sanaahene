require "application_system_test_case"

class BinanceImportLinesTest < ApplicationSystemTestCase
  setup do
    sign_in create(:user)
    @binance_import_line = create(:binance_import_line)
  end

  test "visiting the index" do
    visit binance_import_lines_url
    assert_text @binance_import_line.headline_text
  end

  test "should create binance import line" do
    visit binance_import_lines_url
    click_on "add"

    fill_in "Asset type", with: @binance_import_line.asset_type
    fill_in "Couterparty", with: @binance_import_line.couterparty
    fill_in "Created time", with: @binance_import_line.created_time
    fill_in "Exchange rate", with: @binance_import_line.exchange_rate
    fill_in "Fiat type", with: @binance_import_line.fiat_type
    fill_in "Order number", with: @binance_import_line.order_number
    fill_in "Order type", with: @binance_import_line.order_type
    fill_in "Price", with: @binance_import_line.price
    fill_in "Quantity", with: @binance_import_line.quantity
    fill_in "Status", with: @binance_import_line.status
    fill_in "Total price", with: @binance_import_line.total_price
    click_on "Create Binance import line"

    assert_text "Binance import line was successfully created"
    click_on "arrow_back"
  end

  test "should update Binance import line" do
    visit binance_import_line_url(@binance_import_line)
    click_on "edit", match: :first

    fill_in "Asset type", with: @binance_import_line.asset_type
    fill_in "Couterparty", with: @binance_import_line.couterparty
    fill_in "Created time", with: @binance_import_line.created_time
    fill_in "Exchange rate", with: @binance_import_line.exchange_rate
    fill_in "Fiat type", with: @binance_import_line.fiat_type
    fill_in "Order number", with: @binance_import_line.order_number
    fill_in "Order type", with: @binance_import_line.order_type
    fill_in "Price", with: @binance_import_line.price
    fill_in "Quantity", with: @binance_import_line.quantity
    fill_in "Status", with: @binance_import_line.status
    fill_in "Total price", with: @binance_import_line.total_price
    click_on "Update Binance import line"

    assert_text "Binance import line was successfully updated"
    click_on "arrow_back"
  end

  test "should destroy Binance import line" do
    visit binance_import_line_url(@binance_import_line)
    accept_alert do
        click_on "delete", match: :first
    end

    assert_text "Binance import line was successfully destroyed"
  end
end
