class ServiceTypesController < ApplicationController
  layout "admin"
# GET /defines
# GET /defines.json
def index
  @servicetypes = Define.where( :usetype => 'serviceType' )

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @servicetypes }
  end
end

# GET /defines/1
# GET /defines/1.json
def show
  @servicetype = Define.find(params[:id])

  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @servicetype }
  end
end

# GET /defines/new
# GET /defines/new.json
def new
  @servicetype = Define.new

  respond_to do |format|
    format.html # new.html.erb
    format.json { render json: @servicetype }
  end
end

# GET /defines/1/edit
def edit
  @servicetype = Define.find(params[:id])
end

# POST /defines
# POST /defines.json
def create
  @servicetype = Define.new(params[:define])
  @servicetype.usetype = 'serviceType'

  respond_to do |format|
    if @define.save
      format.html { redirect_to @servicetype, notice: 'Define was successfully created.' }
      format.json { render json: @servicetype, status: :created, location: @servicetype }
    else
      format.html { render action: "new" }
      format.json { render json: @servicetype.errors, status: :unprocessable_entity }
    end
  end
end

# PUT /defines/1
# PUT /defines/1.json
def update
  @servicetype = Define.find(params[:id])

  respond_to do |format|
    if @servicetype.update_attributes(params[:define])
      format.html { redirect_to @servicetype, notice: 'Define was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @servicetype.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /defines/1
# DELETE /defines/1.json
def destroy
  @servicetype = Define.find(params[:id])
  @servicetype.destroy

  respond_to do |format|
    format.html { redirect_to defines_url }
    format.json { head :no_content }
  end
end
end
