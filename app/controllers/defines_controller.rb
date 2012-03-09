class DefinesController < ApplicationController
    layout "admin"
  # GET /defines
  # GET /defines.json
  def index
    @defines = Define.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @defines }
    end
  end

  # GET /defines/1
  # GET /defines/1.json
  def show
    @define = Define.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @define }
    end
  end

  # GET /defines/new
  # GET /defines/new.json
  def new
    @define = Define.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @define }
    end
  end

  # GET /defines/1/edit
  def edit
    @define = Define.find(params[:id])
  end

  # POST /defines
  # POST /defines.json
  def create
    @define = Define.new(params[:define])

    respond_to do |format|
      if @define.save
        format.html { redirect_to @define, notice: 'Define was successfully created.' }
        format.json { render json: @define, status: :created, location: @define }
      else
        format.html { render action: "new" }
        format.json { render json: @define.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /defines/1
  # PUT /defines/1.json
  def update
    @define = Define.find(params[:id])

    respond_to do |format|
      if @define.update_attributes(params[:define])
        format.html { redirect_to @define, notice: 'Define was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @define.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /defines/1
  # DELETE /defines/1.json
  def destroy
    @define = Define.find(params[:id])
    @define.destroy

    respond_to do |format|
      format.html { redirect_to defines_url }
      format.json { head :no_content }
    end
  end
end
