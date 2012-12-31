require 'test_helper'

class RichtextsControllerTest < ActionController::TestCase
  setup do
    @richtext = richtexts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:richtexts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create richtext" do
    assert_difference('Richtext.count') do
      post :create, richtext: { block_id: @richtext.block_id, content: @richtext.content }
    end

    assert_redirected_to richtext_path(assigns(:richtext))
  end

  test "should show richtext" do
    get :show, id: @richtext
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @richtext
    assert_response :success
  end

  test "should update richtext" do
    put :update, id: @richtext, richtext: { block_id: @richtext.block_id, content: @richtext.content }
    assert_redirected_to richtext_path(assigns(:richtext))
  end

  test "should destroy richtext" do
    assert_difference('Richtext.count', -1) do
      delete :destroy, id: @richtext
    end

    assert_redirected_to richtexts_path
  end
end
