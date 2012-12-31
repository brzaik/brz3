class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:approved] == "false"
      @users = User.find_all_by_approved(false)
    else
      @users = User.all
    end
  end

  def toggle_view
    @user = User.find(params[:id])
    if @user.view_as_admin?
      @user.update_column(:view_as_admin, false)
    else
      @user.update_column(:view_as_admin, true)
    end

    respond_to do |format|
      format.html { redirect_to(:back) }
    end
  end

end
