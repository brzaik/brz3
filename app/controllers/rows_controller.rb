class RowsController < ApplicationController
  before_filter :get_section, :authenticate_user!


  def get_section
    @section = Section.find(params[:section_id])
  end

  # GET /rows/new
  # GET /rows/new.json
  def new
    @row = Row.new
    @row.section = @section

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @row }
    end
  end

  # GET /rows/1/edit
  def edit
    @row = Row.find(params[:id])
    @section = @row.section
  end

  # POST /rows
  # POST /rows.json
  def create
    @row = Row.new(params[:row])
    @row.section = @section

    respond_to do |format|
      if @row.save
        format.html { redirect_to @page, :notice => 'Row was successfully created.' }
        format.json { render :json => @row, :status => :created, :location => @row }
      else
        format.html { render :action => "new" }
        format.json { render :json => @row.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rows/1
  # PUT /rows/1.json
  def update
    @row = Row.find(params[:id])
    @section = @row.section

    respond_to do |format|
      if @row.update_attributes(params[:row])
        format.html { redirect_to @page, :notice => 'Row was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @row.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rows/1
  # DELETE /rows/1.json
  def destroy
    @row = Row.find(params[:id])
    @section = @row.section
    @row.destroy

    respond_to do |format|
      format.html { redirect_to @page, :notice => 'Row was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
