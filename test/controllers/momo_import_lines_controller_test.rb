require "test_helper"

class MomoImportLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @momo_import_line = create(:momo_import_line)
  end

  test "should get index" do
    get momo_import_lines_url
    assert_response :success
  end

  test "should show momo_import_line" do
    get momo_import_line_url(@momo_import_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_momo_import_line_url(@momo_import_line)
    assert_response :success
  end

  test "should update momo_import_line" do
    patch momo_import_line_url(@momo_import_line), params: { momo_import_line: { amount: @momo_import_line.amount, bal_after: @momo_import_line.bal_after, bal_before: @momo_import_line.bal_before, e_levy: @momo_import_line.e_levy, f_id: @momo_import_line.f_id, fees: @momo_import_line.fees, from_acct: @momo_import_line.from_acct, from_name: @momo_import_line.from_name, from_no: @momo_import_line.from_no, ova: @momo_import_line.ova, ref: @momo_import_line.ref, to_acct: @momo_import_line.to_acct, to_name: @momo_import_line.to_name, to_no: @momo_import_line.to_no, trans_type: @momo_import_line.trans_type, transaction_date: @momo_import_line.transaction_date } }
    assert_redirected_to momo_import_line_url(@momo_import_line)
  end

  test "should destroy momo_import_line" do
    assert_difference("MomoImportLine.count", -1) do
      delete momo_import_line_url(@momo_import_line)
    end

    assert_redirected_to momo_import_lines_url
  end
end
