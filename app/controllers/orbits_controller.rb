class OrbitsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do 
    redirect_to new_user_session_path unless current_user && current_user.is_admin?
  end

  # GET /orbits
  # GET /orbits.json
  def index
    @orbits = Orbit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orbits }
    end
  end

  # GET /orbits/1
  # GET /orbits/1.json
  def show
    @orbit = Orbit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orbit }
    end
  end

  # GET /orbits/new
  # GET /orbits/new.json
  def new
    @orbit = Orbit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @orbit }
    end
  end

  # GET /orbits/1/edit
  def edit
    @orbit = Orbit.find(params[:id])
  end

  # POST /orbits
  # POST /orbits.json
  def create
    @orbit = Orbit.new(params[:orbit])

    respond_to do |format|
      if @orbit.save
        format.html { redirect_to @orbit, notice: 'Orbit was successfully created.' }
        format.json { render json: @orbit, status: :created, location: @orbit }
      else
        format.html { render action: "new" }
        format.json { render json: @orbit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orbits/1
  # PUT /orbits/1.json
  def update
    @orbit = Orbit.find(params[:id])
    @upload_ids = Array.new
    @positions = Array.new
    @captions = Array.new

    if params.has_key?("upload_id")
      @upload_ids = params[:upload_id].values
    end
    if params.has_key?("positions")
      @positions = params[:positions].values
    end
    if params.has_key?("captions")
      @captions = params[:captions].values
    end

    #raise "Upload_ids: #{@upload_ids}"

    # get hold of all the image ids already mapped to this orbit, and delete any that were not found in the form passed into the controller (this means they were explicitly deleted by the user)
    @all_existing_upload_ids = @orbit.images.map(&:upload_id)
    #raise "#{@all_existing_upload_ids}"
        
    # Use the subtraction operator to get the difference between the arrays
    unless @upload_ids.nil?
      @upload_ids_of_images_to_delete = @all_existing_upload_ids - @upload_ids.map! { |i| i.to_i }

      unless @upload_ids_of_images_to_delete.empty?
        #raise "#{@upload_ids_of_images_to_delete}"
        
        #Search and destroy the images for removed uploads
        @upload_ids_of_images_to_delete.each do |d|
          Image.where(:upload_id => d).destroy_all
        end
      end
    end

    # Iterate through all upload ID's the user has submitted (using an iterator i)
    @upload_ids.each_with_index do |upload_id, i|
      #Check for an existing subscription corresponding the the ID the user submitted
      @this_image = Image.where(:imageable_type => "Orbit", :imageable_id => @orbit.id, :upload_id => upload_id).first
      if @this_image.nil?
        #Create a shiny new object if we don't come up with it
        @this_image = Image.new
      end

      #Update attributes of all subscriptions present in form and populate array with any errors encountered
      @this_image.update_attributes(:imageable_type => "Orbit", :imageable_id => @orbit.id, :upload_id => upload_id, :position => @positions[i], :caption => @captions[i])
    end

    respond_to do |format|
      if @orbit.update_attributes(params[:orbit])
        format.html { redirect_to edit_orbit_path(@orbit), notice: 'Orbit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @orbit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orbits/1
  # DELETE /orbits/1.json
  def destroy
    @orbit = Orbit.find(params[:id])
    @orbit.destroy

    respond_to do |format|
      format.html { redirect_to orbits_url }
      format.json { head :no_content }
    end
  end


  def add_row
    respond_to do |format|
      format.js { }
    end
  end
end
