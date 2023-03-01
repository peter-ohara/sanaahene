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

  test 'should destroy Ecobank import line' do
    visit ecobank_import_line_url(@ecobank_import_line)
    accept_alert do
      click_on 'delete', match: :first
    end

    assert_text 'Ecobank import line was successfully destroyed'
  end
end
