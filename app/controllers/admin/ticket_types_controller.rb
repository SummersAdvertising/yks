class Admin::TicketTypesController < AdminController
  layout "admin"
  before_filter :permission

  def permission
    if session[:user] != 'master'
		  respond_to do |format|
			format.html { redirect_to :controller => :tickets, :action => :index }
		  end
 	 end
  end

# GET /defines
# GET /defines.json
def index
  @tickettypes = Define.where( :usetype => 'tickettype' ).order("sort asc, updated_at desc")
  @tickettype = Define.new

  respond_to do |format|
    format.html # index.html.erb
  end
end

# GET /defines/1
# GET /defines/1.json
def show
  @tickettype = Define.find(params[:id])

  respond_to do |format|
    format.html # show.html.erb
  end
end

# GET /defines/new
# GET /defines/new.json
def new
  @tickettype = Define.new

  respond_to do |format|
    format.html # new.html.erb
  end
end

# GET /defines/1/edit
def edit
  @tickettype = Define.find(params[:id])
end

# POST /defines
# POST /defines.json
def create
  @tickettype = Define.new(params[:define])
  @tickettype.usetype = 'tickettype'

  respond_to do |format|
    if @tickettype.save
      format.html { redirect_to admin_ticket_type_path(@tickettype), notice: t("helpers.notice.new") }
    else
    
  	 @tickettypes = Define.where( :usetype => 'tickettype' ).order("sort asc, updated_at desc")
      format.html { render action: "index" }
    end
  end
end

# PUT /defines/1
# PUT /defines/1.json
def update
  @tickettype = Define.find(params[:id])
  @tickettype.usetype = 'tickettype'

  respond_to do |format|
    if @tickettype.update_attributes(params[:define])
      format.html { redirect_to admin_ticket_type_path(@tickettype), notice: t("helpers.notice.update") }
    else
      format.html { render action: "edit" }
    end
  end
end

	# DELETE /defines/1
	# DELETE /defines/1.json
	def destroy
	  @tickettype = Define.find(params[:id])
	  @tickettype.destroy
	
	  respond_to do |format|
	    format.html { redirect_to admin_ticket_types_url }
	  end
	end

	def move_up
		@tickettype = Define.find( params[:id] )
		
  		@tickettypes = Define.where( :usetype => 'tickettype' ).order("sort asc, updated_at desc")
  		
  		seq = @tickettypes.index( @tickettype )
  		if seq > 0	  		
			# Save current object into temp container
			temp = @tickettypes[ seq - 1 ]
			@tickettypes[ seq-1 ] = @tickettype
			@tickettypes[ seq ] = temp
			
			save_sort_ary( @tickettypes )
		end 
		
		respond_to do | format |
			format.html { redirect_to :action => 'index' }
		end
	end
	
	def move_down	
		@tickettype = Define.find( params[:id] )		
  		@tickettypes = Define.where( :usetype => 'tickettype' ).order("sort asc, updated_at desc")
  		
  		seq = @tickettypes.index( @tickettype )
  		if seq < @tickettypes.size	  		
			# Save current object into temp container
			temp = @tickettypes[ seq + 1 ]
			@tickettypes[ seq + 1 ] = @tickettype
			@tickettypes[ seq ] = temp
			
			save_sort_ary( @tickettypes )
		end 
		
		respond_to do | format |
			format.html { redirect_to :action => 'index' }
		end
	end

private
	def save_sort_ary( ary )
	
		sort_key = 10
		stage = 10
		
		ary.each do | define |
			if define.is_a?( Define )
				
				#assign new sort key
				define.update_attribute('sort', sort_key)
				
				sort_key += stage
			end
		end
	end
end
