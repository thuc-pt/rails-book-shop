require 'test_helper'

class Page1slideControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get page1slide_index_url
    assert_response :success
  end

end
