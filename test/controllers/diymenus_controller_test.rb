require 'test_helper'

class DiymenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diymenu = diymenus(:one)
  end

  test "should get index" do
    get diymenus_url
    assert_response :success
  end

  test "should get new" do
    get new_diymenu_url
    assert_response :success
  end

  test "should create diymenu" do
    assert_difference('Diymenu.count') do
      post diymenus_url, params: { diymenu: { is_show: @diymenu.is_show, key: @diymenu.key, name: @diymenu.name, url: @diymenu.url } }
    end

    assert_redirected_to diymenu_url(Diymenu.last)
  end

  test "should show diymenu" do
    get diymenu_url(@diymenu)
    assert_response :success
  end

  test "should get edit" do
    get edit_diymenu_url(@diymenu)
    assert_response :success
  end

  test "should update diymenu" do
    patch diymenu_url(@diymenu), params: { diymenu: { is_show: @diymenu.is_show, key: @diymenu.key, name: @diymenu.name, url: @diymenu.url } }
    assert_redirected_to diymenu_url(@diymenu)
  end

  test "should destroy diymenu" do
    assert_difference('Diymenu.count', -1) do
      delete diymenu_url(@diymenu)
    end

    assert_redirected_to diymenus_url
  end
end
