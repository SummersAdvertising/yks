class ServicesController < ApplicationController
layout "admin"
  # GET /system_site_maps
  # GET /system_site_maps.json
  def index
    @services = Service.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /system_site_maps/1
  # GET /system_site_maps/1.json
  def show
    @service = Service.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end

  # GET /system_site_maps/new
  # GET /system_site_maps/new.json
  def new
    @service = Service.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @services }
    end
  end

  # GET /system_site_maps/1/edit
  def edit
    @service = Service.find(params[:id])
  end

  # POST /system_site_maps
  # POST /system_site_maps.json
  def create
    @service = Service.new(params[:service])
    #@system_site_map = SystemSiteMap.new( :parent_id => "2", :controller => "service", :parameter => @service.id )

    respond_to do |format|
      if @service.save# && @system_site_map.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /system_site_maps/1
  # PUT /system_site_maps/1.json
  def update
    @service = Service.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to @service, notice: 'System site map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system_site_maps/1
  # DELETE /system_site_maps/1.json
  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
    end
  end
end
