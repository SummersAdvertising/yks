class KnacksController < ApplicationController
	require 'open-uri'

	def show
	
		@knack = Knack.find( params[ :id ] )
		
		
		respond_to do | format |
			if @knack.status != 'disabled'
			
				@categories = KnackCategory.where( :status => "enabled" ).order( "sort ASC" ).all					
				@category = KnackCategory.find( params[ :knack_category_id ] )
				
				@recnet_knacks = @category.knacks.where( :status => "enabled" ).order("date desc").limit(3)

				@category_id = @category.id
				
				@content = JSON.parse(@knack.content) if !@knack.content.nil?
				@paragraphs = @content["article"]
				
				$meta_title = @knack.title
		
		
				$meta_description	= '';
				max_length = 100
				# 產出 og:description
				@paragraphs.each do | p |
					next if p["type"] != "paragraph"
					
					partical_content = p["content"].gsub(/<br([ \/]*)>/, "\n")
					$meta_description += partical_content
					max_length -= partical_content.length
					
					break if max_length <= 0
				end
				
				
				format.html
			else
				format.html { redirect_to knack_category_path( @category ) }
			end
		end
	end
end
