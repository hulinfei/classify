require 'test_helper'

class BannarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bannar = bannars(:one)
  end

  test "should get index" do
    get bannars_url
    assert_response :success
  end

  test "should get new" do
    get new_bannar_url
    assert_response :success
  end

  test "should create bannar" do
    assert_difference('Bannar.count') do
      post bannars_url, params: { bannar: { active: @bannar.active, title: @bannar.title, url: @bannar.url } }
    end

    assert_redirected_to bannar_url(Bannar.last)
  end

  test "should show bannar" do
    get bannar_url(@bannar)
    assert_response :success
  end

  test "should get edit" do
    get edit_bannar_url(@bannar)
    assert_response :success
  end

  test "should update bannar" do
    patch bannar_url(@bannar), params: { bannar: { active: @bannar.active, title: @bannar.title, url: @bannar.url } }
    assert_redirected_to bannar_url(@bannar)
  end

  test "should destroy bannar" do
    assert_difference('Bannar.count', -1) do
      delete bannar_url(@bannar)
    end

    assert_redirected_to bannars_url
  end
end
