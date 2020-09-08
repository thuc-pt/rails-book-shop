require 'test_helper'

class RaiseUpChildControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get raise_up_child_index_url
    assert_response :success
  end

end
