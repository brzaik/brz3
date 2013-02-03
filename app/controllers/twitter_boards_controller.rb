class TwitterBoardsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do 
    redirect_to new_user_session_path unless current_user && current_user.is_admin?
  end

  # # GET /twitter_boards
  # # GET /twitter_boards.json
  # def index
  #   @twitter_boards = TwitterBoard.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render :json => @twitter_boards }
  #   end
  # end

  # # GET /twitter_boards/1
  # # GET /twitter_boards/1.json
  # def show
  #   @twitter_board = TwitterBoard.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render :json => @twitter_boards }
  #   end
  # end

  # # GET /twitter_boards/new
  # # GET /twitter_boards/new.json
  # def new
  #   @twitter_board = TwitterBoard.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render :json => @twitter_boards }
  #   end
  # end

  # # GET /twitter_boards/1/edit
  # def edit
  #   @twitter_board = TwitterBoard.find(params[:id])
  # end

  # # POST /twitter_boards
  # # POST /twitter_boards.json
  # def create
  #   @twitter_board = TwitterBoard.new(params[:twitter_board])

  #   respond_to do |format|
  #     if @twitter_board.save
  #       format.html { redirect_to @twitter_board, :notice => 'Twitter board was successfully created.' }
  #       format.json { render :json => @twitter_board, :status => :created, :location => @twitter_board }
  #     else
  #       format.html { render :action => "new" }
  #       format.json { render :json => @twitter_board.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end

  # # PUT /twitter_boards/1
  # # PUT /twitter_boards/1.json
  # def update
  #   @twitter_board = TwitterBoard.find(params[:id])

  #   respond_to do |format|
  #     if @twitter_board.update_attributes(params[:twitter_board])
  #       format.html { edirect_to @twitter_board, :notice => 'Twitter board was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render :action => "edit" }
  #       format.json { render :json => @twitter_board.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /twitter_boards/1
  # DELETE /twitter_boards/1.json
  def destroy
    @twitter_board = TwitterBoard.find(params[:id])
    @twitter_board.destroy

    respond_to do |format|
      format.html { redirect_to twitter_boards_url }
      format.json { head :no_content }
    end
  end
end
