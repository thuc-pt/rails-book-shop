require 'test_helper'

class ComputerScienceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get computer_science_index_url
    assert_response :success
  end

end
