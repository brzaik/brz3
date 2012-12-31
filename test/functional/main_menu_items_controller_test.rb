require 'test_helper'

class MainMenuItemsControllerTest < ActionController::TestCase
  setup do
    @main_menu_item = main_menu_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:main_menu_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create main_menu_item" do
    assert_difference('MainMenuItem.count') do
      post :create, main_menu_item: { page_id: @main_menu_item.page_id, position: @main_menu_item.position, title: @main_menu_item.title }
    end

    assert_redirected_to main_menu_item_path(assigns(:main_menu_item))
  end

  test "should show main_menu_item" do
    get :show, id: @main_menu_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @main_menu_item
    assert_response :success
  end

  test "should update main_menu_item" do
    put :update, id: @main_menu_item, main_menu_item: { page_id: @main_menu_item.page_id, position: @main_menu_item.position, title: @main_menu_item.title }
    assert_redirected_to main_menu_item_path(assigns(:main_menu_item))
  end

  test "should destroy main_menu_item" do
    assert_difference('MainMenuItem.count', -1) do
      delete :destroy, id: @main_menu_item
    end

    assert_redirected_to main_menu_items_path
  end
end
