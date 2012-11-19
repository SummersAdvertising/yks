class Admin::KnackCategoriesController < AdminController
  # GET /knack_categories
  # GET /knack_categories.json
  def index
    @knack_categories = KnackCategory.order( "sort ASC" ).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @knack_categories }
    end
  end

  # GET /knack_categories/1
  # GET /knack_categories/1.json
  def show
    @knack_category = KnackCategory.find(params[:id])
    @knacks = @knack_category.knacks.order( "status desc, date desc" )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @knack_category }
    end
  end

  # GET /knack_categories/new
  # GET /knack_categories/new.json
  def new
    @knack_category = KnackCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @knack_category }
    end
  end

  # GET /knack_categories/1/edit
  def edit
    @knack_category = KnackCategory.find(params[:id])
  end

  # POST /knack_categories
  # POST /knack_categories.json
  def create
    @knack_category = KnackCategory.new(params[:knack_category])

    respond_to do |format|
      if @knack_category.save
        format.html { redirect_to [:admin, @knack_category], notice: 'Knack category was successfully created.' }
        format.json { render json: @knack_category, status: :created, location: @knack_category }
      else
        format.html { render action: "new" }
        format.json { render json: @knack_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /knack_categories/1
  # PUT /knack_categories/1.json
  def update
    @knack_category = KnackCategory.find(params[:id])

    respond_to do |format|
      if @knack_category.update_attributes(params[:knack_category])
        format.html { redirect_to [:admin, @knack_category], notice: 'Knack category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @knack_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knack_categories/1
  # DELETE /knack_categories/1.json
  def destroy
    @knack_category = KnackCategory.find(params[:id])
    @knack_category.destroy

    respond_to do |format|
      format.html { redirect_to admin_knack_categories_url }
      format.json { head :no_content }
    end
  end
end
