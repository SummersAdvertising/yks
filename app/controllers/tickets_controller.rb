class TicketsController < ApplicationController
layout "admin"
# GET /system_site_maps
# GET /system_site_maps.json
def index
  @tickets = Ticket.all

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @tickets }
  end
end

# GET /system_site_maps/1
# GET /system_site_maps/1.json
def show
  @ticket = Ticket.find(params[:id])

  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @ticket }
  end
end

# GET /system_site_maps/new
# GET /system_site_maps/new.json
def new
  @ticket = Ticket.new

  respond_to do |format|
    format.html # new.html.erb
    format.json { render json: @ticket }
  end
end

# GET /system_site_maps/1/edit
def edit
  @ticket = Ticket.find(params[:id])
end

# POST /system_site_maps
# POST /system_site_maps.json
def create
  @ticket = Ticket.new(params[:ticket])

  respond_to do |format|
    if @ticket.save
      format.html { redirect_to @ticket, notice: 'Service was successfully created.' }
      format.json { render json: @ticket, status: :created, location: @ticket }
    else
      format.html { render action: "new" }
      format.json { render json: @ticket.errors, status: :unprocessable_entity }
    end
  end
end

# PUT /system_site_maps/1
# PUT /system_site_maps/1.json
def update
  @ticket = Ticket.find(params[:id])

  respond_to do |format|
    if @ticket.update_attributes(params[:ticket])
      format.html { redirect_to @ticket, notice: 'System site map was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @ticket.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /system_site_maps/1
# DELETE /system_site_maps/1.json
def destroy
  @ticket = Ticket.find(params[:id])
  @ticket.destroy

  respond_to do |format|
    format.html { redirect_to tickets_url }
    format.json { head :no_content }
  end
end
end
