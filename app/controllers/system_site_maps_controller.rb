class SystemSiteMapsController < ApplicationController

  # GET /system_site_maps
  # GET /system_site_maps.json
  def index
    @system_site_maps = SystemSiteMap.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /system_site_maps/1
  # GET /system_site_maps/1.json
  def show
    @system_site_map = SystemSiteMap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
end
