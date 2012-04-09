class Admin::LoginController < ApplicationController

	layout 'simple'
	
  def index
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end
    def login
      user = params[:user]
      @user = User.where("user = :user AND password = :password", { :user => user["user"], :password => Digest::SHA1.hexdigest(user['password'])})
      respond_to do |format|
        if @user.first != nil
          session[:user] = @user.first.user
          if params[:url] != nil && params[:url] != ""
            format.html { redirect_to params[:url], :status => :moved_permanently }
          else
            format.html { redirect_to controller: "news", action: "index" }  
          end
          #redirect_to controller: "news", action: "index"
        else
          @user = User.new
          session[:user] = nil
          if params[:url] != nil && params[:url] != ""
    			  format.html { redirect_to :controller => :login, :url => params[:url] }
  			  else
      			  format.html { redirect_to :controller => :login }
  			  end
          #render action: "index"
        end
      end
    end
    def logout
      respond_to do |format|
        session[:user] = nil
        format.html { redirect_to action:"index" }
      end
    end
end
