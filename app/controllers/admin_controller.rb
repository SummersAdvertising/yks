class AdminController < ApplicationController
before_filter :set_locale
before_filter :permission

  def permission
    if session[:user] == nil
		  respond_to do |format|
			format.html { redirect_to :controller => :login, :url => request.url }
		  end
 	 end
  end
end
