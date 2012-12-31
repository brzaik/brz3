require 'test_helper'

class TwitterBoardsControllerTest < ActionController::TestCase
  setup do
    @twitter_board = twitter_boards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:twitter_boards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create twitter_board" do
    assert_difference('TwitterBoard.count') do
      post :create, twitter_board: { account_name: @twitter_board.account_name, block_id: @twitter_board.block_id, display_num: @twitter_board.display_num }
    end

    assert_redirected_to twitter_board_path(assigns(:twitter_board))
  end

  test "should show twitter_board" do
    get :show, id: @twitter_board
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @twitter_board
    assert_response :success
  end

  test "should update twitter_board" do
    put :update, id: @twitter_board, twitter_board: { account_name: @twitter_board.account_name, block_id: @twitter_board.block_id, display_num: @twitter_board.display_num }
    assert_redirected_to twitter_board_path(assigns(:twitter_board))
  end

  test "should destroy twitter_board" do
    assert_difference('TwitterBoard.count', -1) do
      delete :destroy, id: @twitter_board
    end

    assert_redirected_to twitter_boards_path
  end
end
