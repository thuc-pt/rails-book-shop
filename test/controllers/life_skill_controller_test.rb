require 'test_helper'

class LifeSkillControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get life_skill_index_url
    assert_response :success
  end

end
