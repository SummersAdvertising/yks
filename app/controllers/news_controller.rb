class NewsController < ApplicationController
layout "admin"
  # GET /system_site_maps
  # GET /system_site_maps.json
  def index
    @news = News.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
    end
  end

  # GET /system_site_maps/1
  # GET /system_site_maps/1.json
  def show
    @new = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @new }
    end
  end

  # GET /system_site_maps/new
  # GET /system_site_maps/new.json
  def new
    @new = News.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @new }
    end
  end

  # GET /system_site_maps/1/edit
  def edit
    @new = News.find(params[:id])
  end

  # POST /system_site_maps
  # POST /system_site_maps.json
  def create
    @new = News.new(params[:news])

    respond_to do |format|
      if @new.save
        format.html { redirect_to @new, notice: 'Service was successfully created.' }
        format.json { render json: @new, status: :created, location: @new }
      else
        format.html { render action: "new" }
        format.json { render json: @new.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /system_site_maps/1
  # PUT /system_site_maps/1.json
  def update
    @new = News.find(params[:id])

    respond_to do |format|
      if @new.update_attributes(params[:news])
        format.html { redirect_to @new, notice: 'System site map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @new.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system_site_maps/1
  # DELETE /system_site_maps/1.json
  def destroy
    @new = News.find(params[:id])
    @new.destroy

    respond_to do |format|
      format.html { redirect_to news_url }
      format.json { head :no_content }
    end
  end
end
