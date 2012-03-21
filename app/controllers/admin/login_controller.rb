class Admin::LoginController < ApplicationController
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
          format.html { redirect_to controller: "news", action: "index" }
        else    
          @user = User.new
          session[:user] = nil
          format.html { render action: "index" }
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
