require 'test_helper'

class CookingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cooking_index_url
    assert_response :success
  end

end
