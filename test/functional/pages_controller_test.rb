require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @page = pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page" do
    assert_difference('Page.count') do
      post :create, page: { description: @page.description, is_homepage: @page.is_homepage, is_project: @page.is_project, logo_image_id: @page.logo_image_id, main_menu_item_id: @page.main_menu_item_id, template_id: @page.template_id, title: @page.title }
    end

    assert_redirected_to page_path(assigns(:page))
  end

  test "should show page" do
    get :show, id: @page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page
    assert_response :success
  end

  test "should update page" do
    put :update, id: @page, page: { description: @page.description, is_homepage: @page.is_homepage, is_project: @page.is_project, logo_image_id: @page.logo_image_id, main_menu_item_id: @page.main_menu_item_id, template_id: @page.template_id, title: @page.title }
    assert_redirected_to page_path(assigns(:page))
  end

  test "should destroy page" do
    assert_difference('Page.count', -1) do
      delete :destroy, id: @page
    end

    assert_redirected_to pages_path
  end
end
