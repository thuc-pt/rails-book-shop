require 'test_helper'

class Page3slideControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get page3slide_index_url
    assert_response :success
  end

end
