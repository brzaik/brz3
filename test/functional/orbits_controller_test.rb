require 'test_helper'

class OrbitsControllerTest < ActionController::TestCase
  setup do
    @orbit = orbits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orbits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orbit" do
    assert_difference('Orbit.count') do
      post :create, orbit: { block_id: @orbit.block_id }
    end

    assert_redirected_to orbit_path(assigns(:orbit))
  end

  test "should show orbit" do
    get :show, id: @orbit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orbit
    assert_response :success
  end

  test "should update orbit" do
    put :update, id: @orbit, orbit: { block_id: @orbit.block_id }
    assert_redirected_to orbit_path(assigns(:orbit))
  end

  test "should destroy orbit" do
    assert_difference('Orbit.count', -1) do
      delete :destroy, id: @orbit
    end

    assert_redirected_to orbits_path
  end
end
