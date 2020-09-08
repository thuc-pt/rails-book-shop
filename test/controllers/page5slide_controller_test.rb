require 'test_helper'

class Page5slideControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get page5slide_index_url
    assert_response :success
  end

end
