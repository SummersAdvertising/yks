class BannersController < ApplicationController
  layout :except => [:index]
	def index
		 @banners = Banner.all

		 respond_to do |format|
		 	format.html
		 end
		 
	end
		
end
