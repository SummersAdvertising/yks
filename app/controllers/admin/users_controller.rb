class Admin::UsersController < AdminController
  layout "admin"
  require 'digest/sha1'
  before_filter :permission, :except => [:change, :changepw]

  def permission
    if !session[:master_admin]
		  respond_to do |format|
			format.html { redirect_to :controller => :tickets, :action => :index }
		  end
 	 end
  end
  
  def change
  @user = User.where("user = :user", { :user => session["user"] }).first
    respond_to do |format|
      format.html
    end
  end
  
  def changepw
    @user = User.where("user = :user and password = :password", { :user => session["user"], :password => Digest::SHA1.hexdigest(params["user"]['password']) }).first

    respond_to do |format|
      if params["newpassword"] == params["confirmpassword"] && @user != nil
        if @user.update_attributes(:password => Digest::SHA1.hexdigest(params["newpassword"]))
          format.html { redirect_to({:controller => :login, :action => :index}, notice: 'change be finaly') }
        end
      end
      format.html { redirect_to action: "change" }
    end
  end
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.password = Digest::SHA1.hexdigest(@user.password)

    respond_to do |format|
      if @user.save
        format.html { redirect_to [:admin,@user], notice: t("helpers.notice.new") }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    params[:user]['password'] = Digest::SHA1.hexdigest(params[:user]['password'])
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to [:admin,@user], notice: t("helpers.notice.update") }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url }
    end
  end
end
