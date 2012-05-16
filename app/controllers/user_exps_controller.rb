class UserExpsController < ApplicationController
	def index
		 
		  @totals = UserExp.where(:status => 'enabled').count
		  @perpage = 5
		  
		  start = params[ :start ] ? params[ :start ].to_i : 0;
		  @user_exps = UserExp.order("time desc").offset( start ).limit( @perpage )
		  @current_page_no = start / @perpage
		 
		 respond_to do |format|
		 	format.html
		 end
		 
	end
end
