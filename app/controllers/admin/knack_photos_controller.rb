class Admin::KnackPhotosController < AdminController
	def index
		@photos = Photo.order('updated_at desc').all

		respond_to do |format|
      		format.html # index.html.erb
      		format.json { render json: @boards }
    	end
	end

	def destroy
		@photo = KnackPhoto.find(params[:id])
		File.delete(@photo.path)
		@photo_id = @photo.id
		@photo.destroy

		respond_to do |format|
      		format.html { redirect_to :controller => 'photos', :action => 'index' }
      		format.js
      		format.json { head :no_content }
    	end
	end

	def create
    @knack = Knack.find(params[:id])
    @photo = @knack.knack_photos.build(params[:photo])

    unless params[:upload_image].blank?
      @upload = params[:upload_image]
      case @upload.content_type
      when 'image/jpeg', 'image/png', 'image/gif'
        @photo.name = @upload.original_filename
        @photo.path = save_image_file(@upload)
        
      else
        @errors = ActiveSupport::JSON.encode('not an image')
      end
    end

    respond_to do |format|
      if @errors
        format.html { render action: "index" } #changed
        format.json { render json: @errors }
      elsif @photo.save
        format.html { redirect_to :controller => 'photos', :action => 'index' }
        format.json { render json: @photo, status: :created }
        format.js
      else
        format.html { render action: "index" } #changed
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def save_image_file(upload)
    unless upload.original_filename.blank?
      filename = upload.original_filename
      filedir = "public/uploads/knack_photos/" + params[:id]
      unless Dir.exists?(filedir)
        Dir.mkdir(filedir)
      end 
      filepath = File.join(filedir, filename)

      f = File.open(filepath,"wb")
      f.write(upload.read)
      f.close

      return filepath
    end
  end
end
