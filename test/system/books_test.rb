require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "creating a Book" do
    visit books_url
    click_on "New Book"

    fill_in "Author", with: @book.author
    fill_in "Category", with: @book.category_id
    fill_in "Company", with: @book.company_id
    fill_in "Detail", with: @book.detail
    fill_in "Formality", with: @book.formality_id
    fill_in "Language", with: @book.language_id
    fill_in "Number page", with: @book.number_page
    fill_in "Price", with: @book.price
    fill_in "Publishing date", with: @book.publishing_date
    fill_in "Size", with: @book.size
    fill_in "Sku", with: @book.sku
    fill_in "Supplier", with: @book.supplier_id
    fill_in "Title", with: @book.title
    fill_in "Url-img", with: @book.url-img
    fill_in "Weight", with: @book.weight
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "updating a Book" do
    visit books_url
    click_on "Edit", match: :first

    fill_in "Author", with: @book.author
    fill_in "Category", with: @book.category_id
    fill_in "Company", with: @book.company_id
    fill_in "Detail", with: @book.detail
    fill_in "Formality", with: @book.formality_id
    fill_in "Language", with: @book.language_id
    fill_in "Number page", with: @book.number_page
    fill_in "Price", with: @book.price
    fill_in "Publishing date", with: @book.publishing_date
    fill_in "Size", with: @book.size
    fill_in "Sku", with: @book.sku
    fill_in "Supplier", with: @book.supplier_id
    fill_in "Title", with: @book.title
    fill_in "Url-img", with: @book.url-img
    fill_in "Weight", with: @book.weight
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "destroying a Book" do
    visit books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book was successfully destroyed"
  end
end
