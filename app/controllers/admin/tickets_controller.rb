class Admin::TicketsController < AdminController
layout "admin"  
  before_filter :permission, :except => [:index, :show, :edit, :update]

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
  @tickets = Ticket.all

  respond_to do |format|
    format.html # index.html.erb
  end
end

# GET /system_site_maps/1
# GET /system_site_maps/1.json
def show
  @ticket = Ticket.find(params[:id])

  respond_to do |format|
    format.html # show.html.erb
  end
end

# GET /system_site_maps/new
# GET /system_site_maps/new.json
def new
  @ticket = Ticket.new

  respond_to do |format|
    format.html # new.html.erb
  end
end

# GET /system_site_maps/1/edit
def edit
  @ticket = Ticket.find(params[:id])
end

  # GET /system_site_maps/1/edit
  def remarkedit
    @ticket = Ticket.find(params[:id])
  end

# POST /system_site_maps
# POST /system_site_maps.json
def create
  @ticket = Ticket.new(params[:ticket])
  @ticket.time = Time.now
  respond_to do |format|
    if @ticket.save
      format.html { redirect_to [:admin,@ticket], notice: t("helpers.notice.new") }
    else
      format.html { render action: "new" }
    end
  end
end

# PUT /system_site_maps/1
# PUT /system_site_maps/1.json
def update
  @ticket = Ticket.find(params[:id])
  @ticket.time = Time.now
  respond_to do |format|
    if @ticket.update_attributes(params[:ticket])
      format.html { redirect_to [:admin,@ticket], notice: t("helpers.notice.update") }
    else
      format.html { render action: "edit" }
    end
  end
end

# DELETE /system_site_maps/1
# DELETE /system_site_maps/1.json
def destroy
  @ticket = Ticket.find(params[:id])
  @ticket.destroy

  respond_to do |format|
    format.html { redirect_to admin_tickets_url }
  end
end
end
