require 'test_helper'

class Page7slideControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get page7slide_index_url
    assert_response :success
  end

end
