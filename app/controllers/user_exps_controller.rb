class UserExpsController < ApplicationController
	def index
		 @user_exps = UserExp.all(:order => "time desc")
		 
		 respond_to do |format|
		 	format.html
		 end
		 
	end
end
