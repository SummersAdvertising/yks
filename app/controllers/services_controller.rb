class ServicesController < ApplicationController
	before_filter :build_service_menu
	
	def index
		 @service = Service.first
		 
		 build_service_content
		 		 
		 respond_to do | format |
		 	format.html { render :template => 'services/show.html.erb' }
		 end
		 
	end
	
	def show
		 @service = Service.find( params[:id] )
		 
		 build_service_content
		 
		  respond_to do | format |
		 	format.html { render :template => 'services/show.html.erb' }
		 end
	end
	
private
	def build_service_menu
		
		services_sitemaps = SystemSiteMap.where(:controller => 'services').order('system_site_map_id ASC, id ASC')
		
		#原始List		
		origin_list = Hash.new()
		#預備輸出的樹狀結構
		menu_tree = Hash.new()
		
		# 取得按照號碼排序的Hash表			
		services_sitemaps.each do | sitemap |
			
			#建立中繼Hash
			mid_hash = Hash.new()
			mid_hash['sitemap'] = sitemap
			mid_hash['children'] = Array.new()
							
			if sitemap.system_site_map_id.to_i != 1			
				origin_list[sitemap.system_site_map_id.to_i]['children'].push(mid_hash)	
			end
							
			origin_list[sitemap.id] = mid_hash
		end
				
		@services = Service.all
		
		# 產生 Service hash
		@services.each do | service |
			origin_list[service.system_site_map_id.to_i]['service'] = service	
		end
		
		@menu_tree = origin_list.first[1]
						
	end
	
	def build_service_content
		
		@service.content = JSON.parse(@service.content)
		
		 @service_id = @service.id
		 current_site_map = SystemSiteMap.find(@service.system_site_map_id)
		 @parent_id = current_site_map.system_site_map_id
		 
	end
end
