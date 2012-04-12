class Admin::UserExpsController < AdminController
layout "admin"  
  before_filter :permission

  def permission
    if session[:user] != 'master'
		  respond_to do |format|
			format.html { redirect_to :controller => :tickets, :action => :index }
		  end
 	 end
  end
# GET /system_site_maps
# GET /system_site_maps.json
def index
  @userexps = UserExp.order("time desc").all

  respond_to do |format|
    format.html # index.html.erb
  end
end

# GET /system_site_maps/1
# GET /system_site_maps/1.json
def show
  @userexp = UserExp.find(params[:id])

  respond_to do |format|
    format.html # show.html.erb
  end
end

# GET /system_site_maps/new
# GET /system_site_maps/new.json
def new
  @userexp = UserExp.new

  respond_to do |format|
    format.html # new.html.erb
  end
end

# GET /system_site_maps/1/edit
def edit
  @userexp = UserExp.find(params[:id])
end

# POST /system_site_maps
# POST /system_site_maps.json
def create
  @userexp = UserExp.new(params[:user_exp])
  
  respond_to do |format|
    if @userexp.save
     file = params[:upload]['filename']
     filename = @userexp.id
     filewhere = "public/user_exps/#{filename}.jpg"
     File.open("#{filewhere}", "wb") do |f|  
        f.write(file.read)  
     end
      format.html { redirect_to [:admin,@userexp], notice: t("helpers.notice.new") }
    else
      format.html { render action: "new" }
    end
  end
end

# PUT /system_site_maps/1
# PUT /system_site_maps/1.json
def update
  @userexp = UserExp.find(params[:id])
  
  respond_to do |format|
    if @userexp.update_attributes(params[:user_exp])
     if params[:upload]     	
	     file = params[:upload]['filename']
	     filename = @userexp.id
	     filewhere = "public/user_exps/#{filename}.jpg"
	     File.open("#{filewhere}", "wb") do |f|  
	        f.write(file.read)  
	     end
     end 
      format.html { redirect_to [:admin,@userexp], notice: t("helpers.notice.update") }
    else
      format.html { render action: "edit" }
    end
  end
end

# DELETE /system_site_maps/1
# DELETE /system_site_maps/1.json
def destroy
  @userexp = UserExp.find(params[:id])
  file = "#{Rails.root}/public/user_exps/#{params[:id]}.jpg"
  File.delete(file) if FileTest.exist?(file)
  @userexp.destroy

  respond_to do |format|
    format.html { redirect_to admin_user_exps_url }
  end
end
end