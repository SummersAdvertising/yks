class KnackCategoriesController < ApplicationController
	before_filter :build_menu

	def index
		@category = @categories.first
		#@knacks = @category.knacks
		
		respond_to do | format |
			if @category.nil?				
				format.html { redirect_to root_url}
			else
				@category_id = @category.id
				format.html { redirect_to :action => "show", :id => @category_id}
			end
		end
	end
	
	def show
		@category = KnackCategory.find( params[ :id ] )
		@knacks = @category.knacks.where( :status => "enabled" ).order( "date desc" )
		@category_id = @category.id
		
		respond_to do | format |
			format.html
		end
	end	

private	

	def build_menu
		@categories = KnackCategory.where( :status => "enabled" ).order( "sort ASC" ).all
	end

	def build_service_content
		
		@service.content = JSON.parse(@service.content)
		
		 @service_id = @service.id
		 current_site_map = SystemSiteMap.find(@service.system_site_map_id)
		 @parent_id = current_site_map.system_site_map_id
		 
	end

end