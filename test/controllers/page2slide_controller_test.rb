require 'test_helper'

class Page2slideControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get page2slide_index_url
    assert_response :success
  end

end
