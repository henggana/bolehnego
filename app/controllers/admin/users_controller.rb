class Admin::UsersController < Admin::BaseController
  def index
    @users = Userlogin.all
  end
  
  def new
    @user = Userlogin.new
    @usertypes = Usertype.all
  end
  
  def create
    @user = Userlogin.new(params[:userlogin])
    if @user.save
      redirect_to admin_users_path, :notice => 'New User has been added'
    else
      render 'new'
    end
  end
  
  def edit
    @user = Userlogin.get(params[:id])
    @usertypes = Usertype.all
  end
  
  def update
    @user = Userlogin.get(params[:id])
    if @user.update_attributes(params[:userlogin])
      redirect_to admin_users_path, :notice => 'User has been edited'
    else
      render 'edit'
    end
  end
  

end
