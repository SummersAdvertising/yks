class Admin::ImagesController < AdminController
    layout :except => [:index]#"admin"
  # GET /defines
  # GET /defines.json
  before_filter :permission

  def permission
    if !session[:master_admin]
		  respond_to do |format|
			format.html { redirect_to :controller => :tickets, :action => :index }
		  end
 	 end
  end
  
  def index
    @dirs = Dir.open("#{Rails.root}/public/#{params[:_controller]}/")
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def destroy
    File.delete("#{Rails.root}/public/news/#{params[:image]}")

    respond_to do |format|
      format.html { redirect_to :controller => :images, :action => :index }
    end
  end
end
