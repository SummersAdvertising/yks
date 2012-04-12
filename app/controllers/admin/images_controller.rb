class Admin::ImagesController < AdminController
    layout "admin"#:except => [:index]
  # GET /defines
  # GET /defines.json
  before_filter :permission

  def permission
    if session[:user] != 'master'
		  respond_to do |format|
			format.html { redirect_to :controller => :tickets, :action => :index }
		  end
 	 end
  end
  def index
    @dirs = Dir.open("#{Rails.root}/public/news/")
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # DELETE /system_site_maps/1
  # DELETE /system_site_maps/1.json
  def destroy
    File.delete("#{Rails.root}/public/news/#{params[:image]}")

    respond_to do |format|
      format.html { redirect_to :controller => :images, :action => :index }
    end
  end
end
