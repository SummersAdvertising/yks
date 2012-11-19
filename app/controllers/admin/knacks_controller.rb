# encoding= utf-8
class Admin::KnacksController < AdminController
	before_filter :get_category


	def new
		@knack = @category.knacks.build
		@knack.title = "未命名秘訣";
		@knack.date = Time.now
		
		@knack.save
		
		respond_to do | format |
			format.html 
		end
	end
	
	def create
		@knack = @category.knacks.build( params[ :knack ] )
		
		respond_to do | format |
			if @knack.save
				format.html { redirect_to edit_admin_knack_category_knack_path( @category, @knack ), :notice => '秘訣建立成功' }
			else
				format.html { render :action => 'new', :notice => '秘訣建立失敗' }
			end
		end
	
	end
	
	def edit
		@knack = Knack.find( params[ :id ] )
				
		respond_to do | format |
			format.html
		end
		
	end

  # PUT /knacks/1
  # PUT /knacks/1.json
  def update
    @knack = Knack.find(params[:id])
        
    respond_to do |format|
      if @knack.update_attributes(params[:knack])
        format.html { redirect_to :action => "edit" }
        format.json { render json: @knack }
      else
        format.html { render action: "edit" }
        format.json { render json: @knack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knacks/1
  # DELETE /knacks/1.json
  def destroy
    @knack = Knack.find(params[:id])
    
    #delete each file
    # Photo.find_each(:knack_id => params[:id]) do |photo|
    #   File.delete(photo.path)
    # end

    #delete whole directory
    require 'fileutils'
    filedir = "app/assets/images/" + params[:id]
    if Dir.exists?(filedir)
      FileUtils.rm_r filedir
    end     

    @knack.destroy

    respond_to do |format|
      format.html { redirect_to knacks_url }
      format.json { head :no_content }
      format.js #added
    end
  end

private
	def get_category
		@category = KnackCategory.find( params[ :knack_category_id ] )		
	end

end
