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

  test "should destroy Binance import line" do
    visit binance_import_line_url(@binance_import_line)
    accept_alert do
        click_on "delete", match: :first
    end

    assert_text "Binance import line was successfully destroyed"
  end
end
