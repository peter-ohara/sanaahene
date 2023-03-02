# frozen_string_literal: true

require 'application_system_test_case'

class CategoriesTest < ApplicationSystemTestCase
  setup do
    sign_in create(:user)
    @category = create(:category)
  end

  test 'visiting the index' do
    visit categories_url
    assert_text @category.name
  end

  test 'should create category' do
    category = build(:category)
    visit categories_url
    click_on 'add'

    fill_in 'Account type', with: category.account_type
    fill_in 'Name', with: category.name
    click_on 'Create Category'

    assert_text 'Category was successfully created'
    click_on 'arrow_back'
  end

  test 'should update Category' do
    visit category_url(@category)
    click_on 'edit', match: :first

    fill_in 'Account type', with: @category.account_type
    fill_in 'Name', with: @category.name
    click_on 'Update Category'

    assert_text 'Category was successfully updated'
    click_on 'arrow_back'
  end

  test 'should destroy Category' do
    visit category_url(@category)
    accept_alert do
      click_on 'delete', match: :first
    end

    assert_text 'Category was successfully destroyed'
  end
end
