class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter do 
    redirect_to new_user_session_path unless current_user && current_user.is_admin?
  end

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
      format.html { redirect_to(:back, notice: 'Toggled admin view') }
    end
  end

end
