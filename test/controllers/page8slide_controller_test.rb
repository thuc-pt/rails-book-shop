require 'test_helper'

class Page8slideControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get page8slide_index_url
    assert_response :success
  end

end
