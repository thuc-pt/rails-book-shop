require 'test_helper'

class TextBookControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get text_book_index_url
    assert_response :success
  end

end
