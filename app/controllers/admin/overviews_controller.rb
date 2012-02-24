  class Admin::OverviewsController < Admin::BaseController
  
  before_filter :authenticate_admin!
   
  def index
    @userlogins = Userlogin.all
  
  end
  
  
end
