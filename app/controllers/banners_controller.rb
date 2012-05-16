class BannersController < ApplicationController
  layout :except => [:index]
	def index
		 @banners = Banner.order('time desc').limit(3)

		 respond_to do |format|
		 	format.html
		 end
		 
	end
		
end
