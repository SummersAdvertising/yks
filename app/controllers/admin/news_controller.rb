class Admin::NewsController < AdminController
  skip_before_filter :verify_authenticity_token
  layout "admin", :except => [:uploadimage]
  before_filter :permission

  require 'uuidtools'
  def permission
    if !session[:master_admin]
		  respond_to do |format|
			format.html { redirect_to :controller => :tickets, :action => :index }
		  end
 	 end
  end
  
  def uploadimage
     number = UUIDTools::UUID.random_create
     file = params['upload']
     filewhere = "#{Rails.root}/public/news/#{number}.jpg"
     File.open("#{filewhere}", "wb") do |f|  
        f.write(file.read)
     end
     filename = "/news/#{number}.jpg"
     message = t('news.upload_success')
    @text = params[:CKEditor].blank? ? @record.to_json(:only=>[:id, :type], :methods=>[:url, :content_type, :size, :filename, :format_created_at], :root => "asset") : "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(#{params[:CKEditorFuncNum]}, \"#{filename}\", \"#{message}\");</script>"
    render :text=>@text
  end

  # GET /system_site_maps
  # GET /system_site_maps.json
  def index  
	@totals = News.count
	@perpage = 5
	
	start = params[ :start ] ? params[ :start ].to_i : 0;
	@news = News.order("time desc").offset( start ).limit( @perpage )
	@current_page_no = start / @perpage
  
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /system_site_maps/1
  # GET /system_site_maps/1.json
  def show
    @new = News.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /system_site_maps/new
  # GET /system_site_maps/new.json
  def new
    @new = News.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /system_site_maps/1/edit
  def edit
  	if params[:id] == 'images'  		
    	@dirs = Dir.open("#{Rails.root}/public/news/")
  		respond_to do |format|
  			format.html { render :template => 'admin/images/index' }
  		end
  		
  	else
    	@new = News.find(params[:id])
    end
    
  end

  # POST /system_site_maps
  # POST /system_site_maps.json
  def create
    @new = News.new(params[:news])

    respond_to do |format|
      if @new.save
        format.html { redirect_to [:admin,@new], notice: t("helpers.notice.new") }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /system_site_maps/1
  # PUT /system_site_maps/1.json
  def update
    @new = News.find(params[:id])

    respond_to do |format|
      if @new.update_attributes(params[:news])
        format.html { redirect_to [:admin,@new], notice: t("helpers.notice.update") }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /system_site_maps/1
  # DELETE /system_site_maps/1.json
  def destroy
    @new = News.find(params[:id])
    @new.destroy

    respond_to do |format|
      format.html { redirect_to :controller => :news, :action => :index }
    end
  end
end
