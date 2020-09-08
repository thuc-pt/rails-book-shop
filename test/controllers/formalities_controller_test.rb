require 'test_helper'

class FormalitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formality = formalities(:one)
  end

  test "should get index" do
    get formalities_url
    assert_response :success
  end

  test "should get new" do
    get new_formality_url
    assert_response :success
  end

  test "should create formality" do
    assert_difference('Formality.count') do
      post formalities_url, params: { formality: { name: @formality.name } }
    end

    assert_redirected_to formality_url(Formality.last)
  end

  test "should show formality" do
    get formality_url(@formality)
    assert_response :success
  end

  test "should get edit" do
    get edit_formality_url(@formality)
    assert_response :success
  end

  test "should update formality" do
    patch formality_url(@formality), params: { formality: { name: @formality.name } }
    assert_redirected_to formality_url(@formality)
  end

  test "should destroy formality" do
    assert_difference('Formality.count', -1) do
      delete formality_url(@formality)
    end

    assert_redirected_to formalities_url
  end
end
