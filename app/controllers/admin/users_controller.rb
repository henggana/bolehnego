class Admin::UsersController < Admin::BaseController
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
    if @user.update_attributes(params[:User])
      redirect_to admin_users_path, :notice => '<div class="notice">User has been edited</div>'
    else
      render 'edit'
    end
  end
  

end
