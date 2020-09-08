require 'test_helper'

class Page4slideControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get page4slide_index_url
    assert_response :success
  end

end
