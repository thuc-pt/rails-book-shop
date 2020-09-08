require 'test_helper'

class Page6slideControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get page6slide_index_url
    assert_response :success
  end

end
