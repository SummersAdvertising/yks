class Admin::ServiceTypesController < AdminController
layout "admin"
  # GET /system_site_maps
  # GET /system_site_maps.json
  def index
    @system_site_maps = SystemSiteMap.where(:system_site_map_id => 2)

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

  # GET /system_site_maps/new
  # GET /system_site_maps/new.json
  def new
    @system_site_map = SystemSiteMap.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /system_site_maps/1/edit
  def edit
    @system_site_map = SystemSiteMap.find(params[:id])
  end

  # POST /system_site_maps
  # POST /system_site_maps.json
  def create
    @system_site_map = SystemSiteMap.new(params[:system_site_map])
    @system_site_map.system_site_map_id = 2
    respond_to do |format|
      if @system_site_map.save
        format.html { redirect_to({:action=>:show, :id=>@system_site_map.id}, notice: t("helpers.notice.new")) }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /system_site_maps/1
  # PUT /system_site_maps/1.json
  def update
    @system_site_map = SystemSiteMap.find(params[:id])

    respond_to do |format|
      if @system_site_map.update_attributes(params[:system_site_map])
        format.html { redirect_to({:action=>:show}, notice: t("helpers.notice.update")) }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /system_site_maps/1
  # DELETE /system_site_maps/1.json
  def destroy
    @system_site_map = SystemSiteMap.find(params[:id])
    @system_site_map.destroy

    respond_to do |format|
      format.html { redirect_to({:action=>:index}, notice: t("helpers.notice.update")) }
    end
  end
end
