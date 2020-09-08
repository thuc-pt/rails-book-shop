require "application_system_test_case"

class FormalitiesTest < ApplicationSystemTestCase
  setup do
    @formality = formalities(:one)
  end

  test "visiting the index" do
    visit formalities_url
    assert_selector "h1", text: "Formalities"
  end

  test "creating a Formality" do
    visit formalities_url
    click_on "New Formality"

    fill_in "Name", with: @formality.name
    click_on "Create Formality"

    assert_text "Formality was successfully created"
    click_on "Back"
  end

  test "updating a Formality" do
    visit formalities_url
    click_on "Edit", match: :first

    fill_in "Name", with: @formality.name
    click_on "Update Formality"

    assert_text "Formality was successfully updated"
    click_on "Back"
  end

  test "destroying a Formality" do
    visit formalities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Formality was successfully destroyed"
  end
end
