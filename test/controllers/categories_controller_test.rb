# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in create(:user)
    @category = create(:category)
  end

  test 'should get index' do
    get categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_category_url
    assert_response :success
  end

  test 'should create category' do
    category = build(:category)
    assert_difference('Category.count') do
      post categories_url, params: { category: { account_type: category.account_type, name: category.name } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test 'should show category' do
    get category_url(@category)
    assert_response :success
  end

  test 'should get edit' do
    get edit_category_url(@category)
    assert_response :success
  end

  test 'should update category' do
    patch category_url(@category), params: { category: { account_type: @category.account_type, name: @category.name } }
    assert_redirected_to category_url(@category)
  end

  test 'should destroy category' do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end
