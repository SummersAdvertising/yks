# encoding=UTF-8
class SystemSiteMapsController < ApplicationController
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
