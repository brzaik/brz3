class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :about]
  # before_filter :except => [:show, :about] do 
  #   redirect_to new_user_session_path unless current_user && current_user.is_admin?
  # end

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
    @page_slug_string = params[:id]
    @page = Page.find_by_slug(@page_slug_string)

    if @page.nil? or (@page.is_private? and current_user.nil?)
      # temporary redirect to old brzaik.com in case the page exists at that application
      redirect_to 'http://old.brzaik.com/pages/' + @page_slug_string
      # redirect_to '/404.html'
    else 
      if @page.upload_id 
        @upload = Upload.find(@page.upload_id)
      end

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

  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new
    @public_tags = Tag.public.all
    @private_tags = Tag.private.all
    @templates = Template.all
    @uploads = Upload.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find_by_slug(params[:id])
    @public_tags = Tag.public.all
    @private_tags = Tag.private.all
    @templates = Template.all
    @uploads = Upload.all
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])
    @tags = Tag.all

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

  def about
    @about_page = Page.about.first

    respond_to do |format|
      format.html { redirect_to @about_page }
      format.json { }
    end
  end

  def make_about_page
    @page = Page.find(params[:id])

    # first change all pages to not be the about page:
    Page.all.each do |page|
      page.update_attributes(:is_about_page => false)
    end

    respond_to do |format|
      if @page.update_attributes(:is_about_page => true)
        format.html { redirect_to pages_path, notice: 'About page changed.' }
      end
    end


  end
end
