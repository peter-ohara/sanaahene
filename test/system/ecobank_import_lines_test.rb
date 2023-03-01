# frozen_string_literal: true

require 'application_system_test_case'

class EcobankImportLinesTest < ApplicationSystemTestCase
  setup do
    sign_in create(:user)
    @ecobank_import_line = create(:ecobank_import_line)
  end

  test 'visiting the index' do
    visit ecobank_import_lines_url
    assert_text @ecobank_import_line.headline_text
  end

  test 'should update Ecobank import line' do
    visit ecobank_import_line_url(@ecobank_import_line)
    click_on 'edit', match: :first

    fill_in 'Balance', with: @ecobank_import_line.balance
    fill_in 'Credit', with: @ecobank_import_line.credit
    fill_in 'Debit', with: @ecobank_import_line.debit
    fill_in 'Description', with: @ecobank_import_line.description
    fill_in 'Notes', with: @ecobank_import_line.notes
    fill_in 'Pnl type', with: @ecobank_import_line.pnl_type
    fill_in 'Reference', with: @ecobank_import_line.reference
    fill_in 'Transaction date', with: @ecobank_import_line.transaction_date
    click_on 'Update Ecobank import line'

    assert_text 'Ecobank import line was successfully updated'
    click_on 'arrow_back'
  end

  test 'should destroy Ecobank import line' do
    visit ecobank_import_line_url(@ecobank_import_line)
    accept_alert do
      click_on 'delete', match: :first
    end

    assert_text 'Ecobank import line was successfully destroyed'
  end
end
