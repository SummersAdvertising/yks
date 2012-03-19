class UserExpsController < ApplicationController
layout "admin"
# GET /system_site_maps
# GET /system_site_maps.json
def index
  @userexps = UserExp.all

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @userexps }
  end
end

# GET /system_site_maps/1
# GET /system_site_maps/1.json
def show
  @userexp = UserExp.find(params[:id])

  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @userexp }
  end
end

# GET /system_site_maps/new
# GET /system_site_maps/new.json
def new
  @userexp = UserExp.new

  respond_to do |format|
    format.html # new.html.erb
    format.json { render json: @userexp }
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
      format.html { redirect_to @userexp, notice: 'Service was successfully created.' }
      format.json { render json: @userexp, status: :created, location: @userexp }
    else
      format.html { render action: "new" }
      format.json { render json: @userexp.errors, status: :unprocessable_entity }
    end
  end
end

# PUT /system_site_maps/1
# PUT /system_site_maps/1.json
def update
  @userexp = UserExp.find(params[:id])

  respond_to do |format|
    if @userexp.update_attributes(params[:user_exp])
      format.html { redirect_to @userexp, notice: 'System site map was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @userexp.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /system_site_maps/1
# DELETE /system_site_maps/1.json
def destroy
  @userexp = UserExp.find(params[:id])
  @userexp.destroy

  respond_to do |format|
    format.html { redirect_to user_exps_url }
    format.json { head :no_content }
  end
end
end