class BlocksController < ApplicationController
  before_filter :get_column, :authenticate_user!
  before_filter do 
    redirect_to new_user_session_path unless current_user && current_user.is_admin?
  end
  
  def get_column
    @column = Column.find(params[:column_id])
  end


  # GET /blocks
  # GET /blocks.json
  def index
    @blocks = Block.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @blocks }
    end
  end

  # GET /blocks/1
  # GET /blocks/1.json
  def show
    @block = Block.find(params[:id])
    @block.column = @column

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @block }
    end
  end

  # GET /blocks/new
  # GET /blocks/new.json
  def new
    @block = Block.new
    @block.column = @column

    respond_to do |format|
      format.html # new.html.erb
      format.js {}
      format.json { render :json => @block }
    end
  end

  # GET /blocks/1/edit
  def edit
    @block = Block.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.js { }
    end
  end

  # POST /blocks
  # POST /blocks.json
  def create
    @block = Block.new(params[:block])
    @block.column = @column
    @page = @column.row.section.page

    respond_to do |format|
      if @block.save
        format.html { redirect_to @page, :notice => 'Block was successfully created.' }
        format.json { render :json => @block, :status => :created, :location => @block }
      else
        format.html { render :action => "new" }
        format.json { render :json => @block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blocks/1
  # PUT /blocks/1.json
  def update
    @block = Block.find(params[:id])
    @block.column = @column
    @page = @column.row.section.page

    respond_to do |format|
      if @block.update_attributes(params[:block])
        format.html { redirect_to @page, :notice => 'Block was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blocks/1
  # DELETE /blocks/1.json
  def destroy
    @block = Block.find(params[:id])
    @page = @block.column.row.section.page
    @block.destroy

    respond_to do |format|
      format.html { redirect_to @page, :notice => 'Block was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
