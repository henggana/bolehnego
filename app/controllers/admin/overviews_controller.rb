class Admin::OverviewsController < Admin::BaseController
  
   
  def index
    @userlogins = Userlogin.all
  
  end
  
  
end
