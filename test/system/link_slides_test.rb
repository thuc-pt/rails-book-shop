require "application_system_test_case"

class LinkSlidesTest < ApplicationSystemTestCase
  setup do
    @link_slide = link_slides(:one)
  end

  test "visiting the index" do
    visit link_slides_url
    assert_selector "h1", text: "Link Slides"
  end

  test "creating a Link slide" do
    visit link_slides_url
    click_on "New Link Slide"

    fill_in "Name", with: @link_slide.name
    click_on "Create Link slide"

    assert_text "Link slide was successfully created"
    click_on "Back"
  end

  test "updating a Link slide" do
    visit link_slides_url
    click_on "Edit", match: :first

    fill_in "Name", with: @link_slide.name
    click_on "Update Link slide"

    assert_text "Link slide was successfully updated"
    click_on "Back"
  end

  test "destroying a Link slide" do
    visit link_slides_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Link slide was successfully destroyed"
  end
end
