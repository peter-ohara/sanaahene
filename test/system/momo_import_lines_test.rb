require "application_system_test_case"

class MomoImportLinesTest < ApplicationSystemTestCase
  setup do
    @momo_import_line = momo_import_lines(:one)
  end

  test "visiting the index" do
    visit momo_import_lines_url
    momo_import_lines.each do |momo_import_line|
      assert_text momo_import_line.name
    end
  end

  test "should create momo import line" do
    visit momo_import_lines_url
    click_on "add"

    fill_in "Amount", with: @momo_import_line.amount
    fill_in "Bal after", with: @momo_import_line.bal_after
    fill_in "Bal before", with: @momo_import_line.bal_before
    fill_in "E levy", with: @momo_import_line.e_levy
    fill_in "F", with: @momo_import_line.f_id
    fill_in "Fees", with: @momo_import_line.fees
    fill_in "From acct", with: @momo_import_line.from_acct
    fill_in "From name", with: @momo_import_line.from_name
    fill_in "From no", with: @momo_import_line.from_no
    fill_in "Ova", with: @momo_import_line.ova
    fill_in "Ref", with: @momo_import_line.ref
    fill_in "To acct", with: @momo_import_line.to_acct
    fill_in "To name", with: @momo_import_line.to_name
    fill_in "To no", with: @momo_import_line.to_no
    fill_in "Trans type", with: @momo_import_line.trans_type
    fill_in "Transaction date", with: @momo_import_line.transaction_date
    click_on "Create Momo import line"

    assert_text "Momo import line was successfully created"
    click_on "arrow_back"
  end

  test "should update Momo import line" do
    visit momo_import_line_url(@momo_import_line)
    click_on "edit", match: :first

    fill_in "Amount", with: @momo_import_line.amount
    fill_in "Bal after", with: @momo_import_line.bal_after
    fill_in "Bal before", with: @momo_import_line.bal_before
    fill_in "E levy", with: @momo_import_line.e_levy
    fill_in "F", with: @momo_import_line.f_id
    fill_in "Fees", with: @momo_import_line.fees
    fill_in "From acct", with: @momo_import_line.from_acct
    fill_in "From name", with: @momo_import_line.from_name
    fill_in "From no", with: @momo_import_line.from_no
    fill_in "Ova", with: @momo_import_line.ova
    fill_in "Ref", with: @momo_import_line.ref
    fill_in "To acct", with: @momo_import_line.to_acct
    fill_in "To name", with: @momo_import_line.to_name
    fill_in "To no", with: @momo_import_line.to_no
    fill_in "Trans type", with: @momo_import_line.trans_type
    fill_in "Transaction date", with: @momo_import_line.transaction_date
    click_on "Update Momo import line"

    assert_text "Momo import line was successfully updated"
    click_on "arrow_back"
  end

  test "should destroy Momo import line" do
    visit momo_import_line_url(@momo_import_line)
    accept_alert do
        click_on "delete", match: :first
    end

    assert_text "Momo import line was successfully destroyed"
  end
end
