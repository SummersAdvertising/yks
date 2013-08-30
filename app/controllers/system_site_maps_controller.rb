# encoding=UTF-8
class SystemSiteMapsController < ApplicationController
	#layout false
	# default index
	def index
		
		@index_services = SystemSiteMap.find(2).system_site_maps.limit(3)
		
		@index_news = News.where( "status = 'enabled' AND not ISNULL(time)").order( "time desc, created_at desc" ).limit(3)
		
		@head_banner = Photo.where( :name => 'index_head_banner' ).first
		@event_banner = Photo.where( :name => 'index_event_banner' ).first
		
	 	respond_to do | format |
		 	format.html { render :layout => nil }
		 end
	end

  # GET /system_site_maps/1
  # GET /system_site_maps/1.json
  def show
    @sitemap = SystemSiteMap.find_by_sql("SELECT * FROM system_site_maps WHERE parameter LIKE '%pagename=" + params[:pagename] + "%'").first
    	
    respond_to do |format|
    	if @sitemap
    		if @sitemap.is_static
	    		@pagename = /pagename=(.*),?/.match(@sitemap.parameter)[1]
	      		format.html { render :template => "pages/" + params[:pagename] }
	      	else
	      		format.html { redirect_to :controller => @sitemap.controller, :action => @sitemap.action }
	      	end
      	else
      		@error_msg = '該頁面不存在'
      		format.html { render :template => "pages/error"}
    	end
    end
  end
    
end