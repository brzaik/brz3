class ColumnsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do 
    redirect_to new_user_session_path unless current_user && current_user.is_admin?
  end

  # TODO remove index, show

  before_filter :get_row
  
  def get_row
    @row = Row.find(params[:row_id])
  end


  # GET /columns/new
  # GET /columns/new.json
  def new
    @column = Column.new
    @column.row = @row

    respond_to do |format|
      format.html # new.html.erb
      format.js {}
      format.json { render :json => @column }
    end
  end

  # GET /columns/1/edit
  def edit
    @column = Column.find(params[:id])
    @row = @column.row

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  # POST /columns
  # POST /columns.json
  def create
    @column = Column.new(params[:column])
    @column.row = @row

    respond_to do |format|
      if @column.save
        format.html { redirect_to @row.section.page, :notice => 'Column was successfully created.' }
        format.json { render :json => @column, :status => :created, :location => @column }
      else
        format.html { render :action => "new" }
        format.json { render :json => @column.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /columns/1
  # PUT /columns/1.json
  def update
    @column = Column.find(params[:id])
    @row = @column.row

    respond_to do |format|
      if @column.update_attributes(params[:column])
        format.html { redirect_to @row.section.page, :notice => 'Column was successfully updated.' }
        format.js { }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.js { }
        format.json { render :json => @column.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /columns/1
  # DELETE /columns/1.json
  def destroy
    @column = Column.find(params[:id])
    @page = @column.row.section.page
    @column.destroy

    respond_to do |format|
      format.html { redirect_to @page, :notice => 'Column was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
