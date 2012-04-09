class NewsController < ApplicationController
	before_filter :news_menu

	def index		 
		@news = News.first
		 
		 respond_to do |format|
		 	format.html { render :template => 'news/show' }
		 end
	end
	
	def show
		 @news = News.find(params[:id])
		 
		 respond_to do |format|
		 	format.html
		 end
	end
	
private
	def news_menu
		 @news_all = News.all
	end
end
