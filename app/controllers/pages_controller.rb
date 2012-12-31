class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :logovid, :homepage]

  def logovid
    respond_to do |format|
      format.html { render :layout => "plain" }
    end
  end

  def homepage
    @all_homepages = Page.homepage.all

    redirect_to @all_homepages[0]
  end

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find_by_slug(params[:id])
    if @page.template
      begin
        @template = @page.template
        
        respond_to do |format|
          format.html {render "templates/stored/#{@template.template_name}", :layout => true, :locals => { :page => @page }}
          format.json { render :json => @page }
        end
      #redirect non-existent page requests to the 404 page
      rescue ActiveRecord::RecordNotFound
        redirect_to '/404.html'
      end
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @page }
      end
    end

  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new
    @templates = Template.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find_by_slug(params[:id])
    @templates = Template.all
    @uploads = Upload.all
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, :notice => 'Page was successfully created.' }
        format.json { render :json => @page, :status => :created, :location =>@page }
      else
        format.html { render :action => "new" }
        format.json { render :json => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find_by_slug(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, :notice => 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end
end
