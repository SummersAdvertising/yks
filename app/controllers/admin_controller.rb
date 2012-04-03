class AdminController < ApplicationController
before_filter :set_locale
before_filter :permission

  def permission
    if session[:user] == nil
		  respond_to do |format|
			format.html { redirect_to :controller => :login }
		  end
 	 end
  end
end
