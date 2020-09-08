require 'test_helper'

class LinkSlidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @link_slide = link_slides(:one)
  end

  test "should get index" do
    get link_slides_url
    assert_response :success
  end

  test "should get new" do
    get new_link_slide_url
    assert_response :success
  end

  test "should create link_slide" do
    assert_difference('LinkSlide.count') do
      post link_slides_url, params: { link_slide: { name: @link_slide.name } }
    end

    assert_redirected_to link_slide_url(LinkSlide.last)
  end

  test "should show link_slide" do
    get link_slide_url(@link_slide)
    assert_response :success
  end

  test "should get edit" do
    get edit_link_slide_url(@link_slide)
    assert_response :success
  end

  test "should update link_slide" do
    patch link_slide_url(@link_slide), params: { link_slide: { name: @link_slide.name } }
    assert_redirected_to link_slide_url(@link_slide)
  end

  test "should destroy link_slide" do
    assert_difference('LinkSlide.count', -1) do
      delete link_slide_url(@link_slide)
    end

    assert_redirected_to link_slides_url
  end
end
