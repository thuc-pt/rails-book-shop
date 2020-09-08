require 'test_helper'

class StoryPictureControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get story_picture_index_url
    assert_response :success
  end

end
