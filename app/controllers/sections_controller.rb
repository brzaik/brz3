class SectionsController < ApplicationController
  before_filter :get_page, :authenticate_user!


  def get_page
    @page = Page.find(params[:page_id])
  end

  # GET /sections/new
  # GET /sections/new.json
  def new
    @section = Section.new
    @section.page = @page

    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render :json => @section }
    end
  end

  # GET /sections/1/edit
  def edit
    @section = Section.find(params[:id])
    @page = @section.page
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(params[:section])
    @section.page = @page

    respond_to do |format|
      if @section.save
        format.html { redirect_to @page, :notice => 'Section was successfully created.' }
        format.json { render :json => @section, :status => :created, :location => @section }
      else
        format.html { render :action => "new" }
        format.json { render :json => @section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sections/1
  # PUT /sections/1.json
  def update
    @section = Section.find(params[:id])
    @page = @section.page

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to @page, :notice => 'Section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section = Section.find(params[:id])
    @page = @section.page
    @section.destroy

    respond_to do |format|
      format.html { redirect_to @page, :notice => 'Section was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
