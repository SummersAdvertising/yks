class Admin::ServicesController < AdminController
layout "admin"
  # GET /system_site_maps
  # GET /system_site_maps.json
  def index
    @services = SystemSiteMap.where( :system_site_map_id => params[:pid])
    @system_site_map = SystemSiteMap.find(params[:pid])

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
    parent_system_site_map_id = params[:pid]
    #system_site_map = SystemSiteMap.where( :parameter => @service.system_site_map_id ).first
    
    respond_to do |format|
      if @service.save# && @system_site_map.save
      system_site_map = SystemSiteMap.new( :system_site_map_id => parent_system_site_map_id, :title => @service.title, :controller => "services", :parameter => @service.id )
      system_site_map.save
        @service.update_attributes(:system_site_map => system_site_map)
        #<div class="field form-title">
        #  <%= f.label :parent_id, '所屬服務' %><br />
      	#<%= select('system_site_map', 'parent_id', SystemSiteMap.where(:system_site_map_id => 2).collect {|p| [ p.title, p.id.to_s ] }, :selected => (params["action"] == "edit"? @service.system_site_map.system_site_map.id : 0) )%>
        #</div>
        format.html { redirect_to({:action => "show", :id => @service.id, :pid => params[:pid]}, notice: t("helpers.notice.new")) }
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
    parent_system_site_map_id = params[:pid]

    respond_to do |format|
      if @service.update_attributes(params[:service])
        system_site_map.update_attributes(:title => @service.title, :system_site_map_id => parent_system_site_map_id)
        format.html { redirect_to({:action => "show", :id => @service.id, :pid => params[:pid]}, notice: t("helpers.notice.update")) }
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
    system_site_map.destroy
    @service.destroy

    respond_to do |format|
      format.html { redirect_to :action => "index", :pid => params[:pid] }
    end
  end
end
