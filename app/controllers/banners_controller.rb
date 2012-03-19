class BannersController < ApplicationController
    layout "admin"
# GET /system_site_maps
# GET /system_site_maps.json
def index
  @banners = Banner.all

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @banners }
  end
end

# GET /system_site_maps/1
# GET /system_site_maps/1.json
def show
  @banner = Banner.find(params[:id])

  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @banner }
  end
end

# GET /system_site_maps/new
# GET /system_site_maps/new.json
def new
  @banner = Banner.new

  respond_to do |format|
    format.html # new.html.erb
    format.json { render json: @banner }
  end
end

# GET /system_site_maps/1/edit
def edit
  @banner = Banner.find(params[:id])
end

# POST /system_site_maps
# POST /system_site_maps.json
def create
  @banner = Banner.new(params[:banner])

  respond_to do |format|
    if @banner.save
      format.html { redirect_to @banner, notice: 'Service was successfully created.' }
      format.json { render json: @banner, status: :created, location: @banner }
    else
      format.html { render action: "new" }
      format.json { render json: @banner.errors, status: :unprocessable_entity }
    end
  end
end

# PUT /system_site_maps/1
# PUT /system_site_maps/1.json
def update
  @banner = Banner.find(params[:id])

  respond_to do |format|
    if @banner.update_attributes(params[:banner])
      format.html { redirect_to @banner, notice: 'System site map was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @banner.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /system_site_maps/1
# DELETE /system_site_maps/1.json
def destroy
  @banner = Banner.find(params[:id])
  @banner.destroy

  respond_to do |format|
    format.html { redirect_to banners_url }
    format.json { head :no_content }
  end
end
end
