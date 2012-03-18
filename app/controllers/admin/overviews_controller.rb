class Admin::OverviewsController < Admin::BaseController
  
   
  def index
    @users = User.all
  
  end
  
  
end
