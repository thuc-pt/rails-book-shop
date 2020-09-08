require 'test_helper'

class BusinessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get business_index_url
    assert_response :success
  end

end
