class UserExpsController < ApplicationController
	def index
		 @user_exps = UserExp.all
		 
		 respond_to do |format|
		 	format.html
		 end
		 
	end
end
