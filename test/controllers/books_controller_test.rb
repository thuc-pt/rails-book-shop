require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { author: @book.author, category_id: @book.category_id, company_id: @book.company_id, detail: @book.detail, formality_id: @book.formality_id, language_id: @book.language_id, number_page: @book.number_page, price: @book.price, publishing_date: @book.publishing_date, size: @book.size, sku: @book.sku, supplier_id: @book.supplier_id, title: @book.title, url-img: @book.url-img, weight: @book.weight } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, category_id: @book.category_id, company_id: @book.company_id, detail: @book.detail, formality_id: @book.formality_id, language_id: @book.language_id, number_page: @book.number_page, price: @book.price, publishing_date: @book.publishing_date, size: @book.size, sku: @book.sku, supplier_id: @book.supplier_id, title: @book.title, url-img: @book.url-img, weight: @book.weight } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
