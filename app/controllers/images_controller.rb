class ImagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter do 
    redirect_to new_user_session_path unless current_user && current_user.is_admin?
  end

  # we may not need to ever use the controller methods for CRUD, but we leave it here just in case we want to for the imageable relationship
  
  # GET /images
  # GET /images.json
  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  # this is meant to be accessed through new_page_image_path!
  def new
    @imageable = find_imageable
    @image = Image.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    @imageable = find_imageable
    @image = @imageable.images.build(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to @imageable, :notice => 'Image was successfully created.' }
        format.json { render :json => @image, :status => :created, :location => @image }
      else
        format.html { render :action => "new" }
        format.json { render :json => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, :notice => 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @imageable = find_imageable
    @image.destroy

    respond_to do |format|
      format.html { redirect_to @imageable, :notice => "Image was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def find_imageable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
