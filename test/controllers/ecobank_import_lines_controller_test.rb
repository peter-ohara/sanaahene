require "test_helper"

class EcobankImportLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in create(:user)
    @ecobank_import_line = create(:ecobank_import_line)
  end

  test "should get index" do
    get ecobank_import_lines_url
    assert_response :success
  end

  test "should show ecobank_import_line" do
    get ecobank_import_line_url(@ecobank_import_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_ecobank_import_line_url(@ecobank_import_line)
    assert_response :success
  end

  test "should update ecobank_import_line" do
    patch ecobank_import_line_url(@ecobank_import_line), params: { ecobank_import_line: { balance: @ecobank_import_line.balance, credit: @ecobank_import_line.credit, debit: @ecobank_import_line.debit, description: @ecobank_import_line.description, notes: @ecobank_import_line.notes, pnl_type: @ecobank_import_line.pnl_type, reference: @ecobank_import_line.reference, transaction_date: @ecobank_import_line.transaction_date } }
    assert_redirected_to ecobank_import_line_url(@ecobank_import_line)
  end

  test "should destroy ecobank_import_line" do
    assert_difference("EcobankImportLine.count", -1) do
      delete ecobank_import_line_url(@ecobank_import_line)
    end

    assert_redirected_to ecobank_import_lines_url
  end
end
