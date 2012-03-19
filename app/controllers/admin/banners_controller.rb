class Admin::BannersController < AdminController
protect_from_forgery :except => 'upload'
    layout "admin"
# GET /system_site_maps
# GET /system_site_maps.json
def index
  @banners = Banner.all

  respond_to do |format|
    format.html # index.html.erb
  end
end

# GET /system_site_maps/1
# GET /system_site_maps/1.json
def show
  @banner = Banner.find(params[:id])

  respond_to do |format|
    format.html # show.html.erb
  end
end

# GET /system_site_maps/new
# GET /system_site_maps/new.json
def new
  @banner = Banner.new

  respond_to do |format|
    format.html # new.html.erb
  end
end
# GET /system_site_maps/1/edit
def edit
  @banner = Banner.find(params[:id])
end

# POST /system_site_maps
# POST /system_site_maps.json
def create
  @banner = Banner.new(params[:banner])

  respond_to do |format|
    if @banner.save
      @post = DataFile.save(params[:upload])
      format.html { redirect_to [:admin,@banner], notice: 'Service was successfully created.' }
    else
      format.html { render action: "new" }
    end
  end
end

# PUT /system_site_maps/1
# PUT /system_site_maps/1.json
def update
  @banner = Banner.find(params[:id])

  respond_to do |format|
    if @banner.update_attributes(params[:banner])
       #name =  upload['datafile'].original_filename
       #directory = "public/data"
       # create the file path
       #path = File.join(directory, name)
       # write the file
       #File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
      #@post = DataFile.save(params[:upload], @banner.id.to_s)
      format.html { redirect_to [:admin,@banner], notice: 'System site map was successfully updated.' }
    else
      format.html { render action: "edit" }
    end
  end
end

# DELETE /system_site_maps/1
# DELETE /system_site_maps/1.json
def destroy
  @banner = Banner.find(params[:id])
  @banner.destroy

  respond_to do |format|
    format.html { redirect_to admin_banners_url }
  end
end
end
