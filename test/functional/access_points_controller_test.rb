require 'test_helper'

class AccessPointsControllerTest < ActionController::TestCase
  setup do
    @access_point = access_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:access_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create access_point" do
    assert_difference('AccessPoint.count') do
      post :create, access_point: { ap_type: @access_point.ap_type, channel: @access_point.channel, encryption_type: @access_point.encryption_type, first_seen: @access_point.first_seen, last_seen: @access_point.last_seen, mac: @access_point.mac, ssid: @access_point.ssid, strength: @access_point.strength }
    end

    assert_redirected_to access_point_path(assigns(:access_point))
  end

  test "should show access_point" do
    get :show, id: @access_point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @access_point
    assert_response :success
  end

  test "should update access_point" do
    put :update, id: @access_point, access_point: { ap_type: @access_point.ap_type, channel: @access_point.channel, encryption_type: @access_point.encryption_type, first_seen: @access_point.first_seen, last_seen: @access_point.last_seen, mac: @access_point.mac, ssid: @access_point.ssid, strength: @access_point.strength }
    assert_redirected_to access_point_path(assigns(:access_point))
  end

  test "should destroy access_point" do
    assert_difference('AccessPoint.count', -1) do
      delete :destroy, id: @access_point
    end

    assert_redirected_to access_points_path
  end
end
