require 'test_helper'

class ScienceFictionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get science_fiction_index_url
    assert_response :success
  end

end
