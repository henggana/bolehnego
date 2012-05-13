class Admin::UsersController < Admin::BaseController
  before_filter :load_resources
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
    @usertypes = Usertype.all
  end
  
  def create
    @usertypes = Usertype.all
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_users_path, :notice => '<div class="notice">New User has been added</div>'
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.get(params[:id])
    @usertypes = Usertype.all
  end
  
  def update
    @user = User.get(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html {redirect_to admin_users_path, :notice => '<div class="notice">User has been edited</div>'}
        format.js
      else
        render 'edit'
      end
    end
  end
  
  def destroy
    @user = User.get(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end
  
  def changepriv
    @user = User.get(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.js 
      end
    end
  end
  
  def load_resources
    @usertypes = Usertype.all
  end
  

end
