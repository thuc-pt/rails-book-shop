require 'test_helper'

class MedicalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get medical_index_url
    assert_response :success
  end

end
