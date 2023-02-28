require "application_system_test_case"

class TagsTest < ApplicationSystemTestCase
  setup do
    sign_in create(:user)
    @tag = create(:tag)
  end

  test "visiting the index" do
    visit tags_url
    tags.each do |tag|
      assert_text tag.name
    end
  end

  test "should create tag" do
    visit tags_url
    click_on "add"

    fill_in "Name", with: "Short term rental"
    click_on "Create Tag"

    assert_text "Tag was successfully created"
    click_on "arrow_back"
  end

  test "should update Tag" do
    visit tag_url(@tag)
    click_on "edit", match: :first

    fill_in "Name", with: @tag.name
    click_on "Update Tag"

    assert_text "Tag was successfully updated"
    click_on "arrow_back"
  end

  test "should destroy Tag" do
    visit tag_url(@tag)
    accept_alert do
      click_on "delete", match: :first
    end

    assert_text "Tag was successfully destroyed"
  end
end
