class Admin::ServicesController < AdminController
layout "admin"
  # GET /system_site_maps
  # GET /system_site_maps.json
  def index
    @services = Service.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /system_site_maps/1
  # GET /system_site_maps/1.json
  def show
    @service = Service.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /system_site_maps/new
  # GET /system_site_maps/new.json
  def new
    @service = Service.new

    respond_to do |format|
      format.html # new.html.erb
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
    #
    
    #@service.system_site_map_id = system_site_map.id
    
    respond_to do |format|
      if @service.save# && @system_site_map.save
        system_site_map = SystemSiteMap.new( :parent_id => "2", :title => @service.title, :controller => "services", :parameter => @service.id )
        system_site_map.save
        @service.update_attributes(:system_site_maps_id => system_site_map.id)
        
        format.html { redirect_to [:admin, @service], notice: t("helpers.notice.new") }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /system_site_maps/1
  # PUT /system_site_maps/1.json
  def update
    @service = Service.find(params[:id])
    system_site_map = SystemSiteMap.where( :parameter => params[:id] ).first

    respond_to do |format|
      if @service.update_attributes(params[:service])
        system_site_map.update_attributes(:title => @service.title)
        format.html { redirect_to [:admin,@service], notice: t("helpers.notice.update") }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /system_site_maps/1
  # DELETE /system_site_maps/1.json
  def destroy
    @service = Service.find(params[:id])
    system_site_map = SystemSiteMap.where( :parameter => params[:id] ).first
    system_site_map.destroy if system_site_map != nil
    @service.destroy

    respond_to do |format|
      format.html { redirect_to admin_services_url }
    end
  end
end
