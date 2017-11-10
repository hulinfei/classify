require 'test_helper'

class BottomMenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bottom_menu = bottom_menus(:one)
  end

  test "should get index" do
    get bottom_menus_url
    assert_response :success
  end

  test "should get new" do
    get new_bottom_menu_url
    assert_response :success
  end

  test "should create bottom_menu" do
    assert_difference('BottomMenu.count') do
      post bottom_menus_url, params: { bottom_menu: { icon: @bottom_menu.icon, name: @bottom_menu.name } }
    end

    assert_redirected_to bottom_menu_url(BottomMenu.last)
  end

  test "should show bottom_menu" do
    get bottom_menu_url(@bottom_menu)
    assert_response :success
  end

  test "should get edit" do
    get edit_bottom_menu_url(@bottom_menu)
    assert_response :success
  end

  test "should update bottom_menu" do
    patch bottom_menu_url(@bottom_menu), params: { bottom_menu: { icon: @bottom_menu.icon, name: @bottom_menu.name } }
    assert_redirected_to bottom_menu_url(@bottom_menu)
  end

  test "should destroy bottom_menu" do
    assert_difference('BottomMenu.count', -1) do
      delete bottom_menu_url(@bottom_menu)
    end

    assert_redirected_to bottom_menus_url
  end
end
