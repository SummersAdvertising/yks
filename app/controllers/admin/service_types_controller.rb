class Admin::ServiceTypesController < AdminController
layout "admin"  
  before_filter :permission

  def permission
    if session[:user] != 'master'
		  respond_to do |format|
			format.html { redirect_to :controller => :tickets, :action => :index }
		  end
 	 end
  end
  # GET /system_site_maps
  # GET /system_site_maps.json
  def index
    @services = SystemSiteMap.where(:system_site_map_id => 2)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /system_site_maps/1
  # GET /system_site_maps/1.json
  def show
    @service = Service.find(params[:id])
    build_service_content
    
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
    build_service_content
  end

  # POST /system_site_maps
  # POST /system_site_maps.json
  def create
    @service = Service.new(params[:service])
    
    package_content
  
    respond_to do |format|
      if @service.save# && @system_site_map.save
        system_site_map = SystemSiteMap.new( :system_site_map_id => 2, :title => @service.title, :controller => "services", :parameter => @service.id )
        system_site_map.save
        @service.update_attributes(:system_site_map => system_site_map)
        format.html { redirect_to({:action=>:show, :id=>@service.id}, notice: t("helpers.notice.new")) }
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
    
    package_content
    
    respond_to do |format|
      if @service.update_attributes(params[:service])
        system_site_map.update_attributes(:title => @service.title)
        format.html { redirect_to({:action=>:show}, notice: t("helpers.notice.update")) }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /system_site_maps/1
  # DELETE /system_site_maps/1.json
  def destroy
  
	_destroy( params[:id] )

    respond_to do |format|
      format.html { redirect_to({:action=>:index}, notice: t("helpers.notice.update")) }
    end
  end
  
private
	def _destroy( id )			
	    service = Service.find( id )
	    # 遞回方式摧毀其下的所有子節點
	    children = SystemSiteMap.where( :system_site_map_id => service.system_site_map_id )
	    
	    if children.length > 0
		    children.each do | child |
		    	child_service = Service.where( :system_site_map_id => child.id )[0]
		    	_destroy( child_service.id )
		    end
		end	    
		
		system_site_map = SystemSiteMap.where( :parameter => id ).first
	    
	    system_site_map.destroy
	    service.destroy
	    
	end

	def package_content		
	    contents = params[:contents]	    
	    @service.content = ActiveSupport::JSON.encode(contents	)
	    
	 end

 	def build_service_content

 		@service.content = JSON.parse(@service.content)

 	end
end
