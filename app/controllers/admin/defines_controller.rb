class Admin::DefinesController < AdminController
    layout "admin"
  # GET /defines
  # GET /defines.json
  def index
    @defines = Define.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /defines/1
  # GET /defines/1.json
  def show
    @define = Define.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /defines/new
  # GET /defines/new.json
  def new
    @define = Define.new

    respond_to do |format|
      format.html # new.html.erb
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
        format.html { redirect_to [:admin,@define], notice: t("helpers.notice.new") }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /defines/1
  # PUT /defines/1.json
  def update
    @define = Define.find(params[:id])

    respond_to do |format|
      if @define.update_attributes(params[:define])
        format.html { redirect_to [:admin,@define], notice: t("helpers.notice.update") }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /defines/1
  # DELETE /defines/1.json
  def destroy
    @define = Define.find(params[:id])
    @define.destroy

    respond_to do |format|
      format.html { redirect_to admin_defines_url }
    end
  end
end
