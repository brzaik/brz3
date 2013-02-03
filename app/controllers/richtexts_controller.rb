class RichtextsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do 
    redirect_to new_user_session_path unless current_user && current_user.is_admin?
  end

  # DELETE /richtexts/1
  # DELETE /richtexts/1.json
  def destroy
    @richtext = Richtext.find(params[:id])
    @richtext.destroy

    respond_to do |format|
      format.html { redirect_to richtexts_url }
      format.json { head :no_content }
    end
  end
end
