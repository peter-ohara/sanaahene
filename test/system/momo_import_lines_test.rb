# frozen_string_literal: true

require 'application_system_test_case'

class MomoImportLinesTest < ApplicationSystemTestCase
  setup do
    sign_in create(:user)
    @momo_import_line = create(:momo_import_line)
  end

  test 'visiting the index' do
    visit momo_import_lines_url
    assert_text @momo_import_line.headline_text
  end

  test 'should destroy Momo import line' do
    visit momo_import_line_url(@momo_import_line)
    accept_alert do
      click_on 'delete', match: :first
    end

    assert_text 'Momo import line was successfully destroyed'
  end
end
