class Admin::PhotosController < AdminController
	def index
		 @photos = Photo.order('updated_at desc').all		 
	end
	
	def show
		 @photo = Photo.find( params[:id] )
	end
	
	def new
		@photo = Photo.new
		
		@photo.properties = Hash.new
		@photo.properties['width'] = ''
		@photo.properties['height'] = ''
		
		respond_to do | format |
			format.html
		end
	end
	
	def edit
		 @photo = Photo.find( params[:id] )		 
	end
		
	def create
		 @photo = Photo.new( params[:photo] )
		
		process_upload
			
		@photo.properties = params[ :properties ]
		
	 	 if !@error && !@photo.save
	 	 	 @errors = true
	 		 @error_msg = "Photo save error."
	 	 end		 	
		 
		 respond_to do | format |
		 	if @error
		 		format.html { render :action => :new, :notice => @error_msg  }
		 	else
		 		format.html { redirect_to [:admin, @photo] }
		 	end		 	
		 end
		 
	end
	
	def update
		 
		@photo = Photo.find( params[:id] )
		
		@origin_filename = @photo.filename;		
		@origin_filepath = @photo.file_path + @photo.name + '.' + @photo.file_extension;		
		
		@photo.name = params[ :photo ][ :name ] if !params[ :photo ].nil? && !params[ :photo ][ :name ].nil?
		
		if !params[:upload_file].nil?
			File.delete(@origin_filepath)
			process_upload
		else 
			File.rename(@origin_filepath, @photo.file_path + @photo.name + '.' + @photo.file_extension)
			@photo.filename = root_url + 'uploads/photos/' + @photo.name + '.' + @photo.file_extension
		end
		
		@photo.properties =@photo.properties.merge(params[ :properties ])
		
		if !@error && !@photo.save
			@errors = true
			@error_msg = "Photo save error."
		end		 	
		 
		respond_to do | format |
			if @error
		 		format.html { render :action => :new, :notice => @error_msg  }
		 	else
		 		format.html { redirect_to [:admin, @photo] }
		 	end		 	
		end
	end
	
	def destroy
		 @photo = Photo.find( params[ :id ] )
		 
		 # remove file
		 File.delete(@photo.file_path + @photo.name + '.' + @photo.file_extension)
		 # delete record form database
		 @photo.destroy
		 respond_to do | format |
		 	format.html { redirect_to :action => 'index' }
		 end
	end
	
private 
	def process_upload
		
		 @error = false
		 @error_msg = ''
		 		 
		 if params[:upload_file]['filename'] == nil
		 	@error = true
		 else 
		 			 	
		 	@upload_file = params[:upload_file]['filename'] 
		 	
		 	#get original filename
		 	@photo.filename = @upload_file.original_filename
		 	
		 	# check file type and save
		 	case @upload_file.content_type
		 	when 'image/jpeg'
		 		@photo.file_extension = 'jpg'
		 		
		 	when 'image/png'
		 		@photo.file_extension = 'png'
		 	
		 	when 'image/gif'
		 		@photo.file_extension = 'gif'
		 	
		 	else
		 		@errors = true
		 		@error_msg = "#{@upload_file.content_type} is wrong file type for photos."
		 	end
		 	
		 	@photo.file_path = "public/uploads/photos/"
		 	file_name = @photo.name + '.' + @photo.file_extension
		 	File.open( @photo.file_path + file_name , 'wb') do | file |
		 		file.write( @upload_file.read )
		 	end
			
			@photo.filename = root_url + 'uploads/photos/' + file_name
		 end
	end
end
