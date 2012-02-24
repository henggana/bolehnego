require 'dm-rails/middleware/identity_map'
class Admin::BaseController < ApplicationController
  layout 'admin'
  
  def current_ability
    @current_ability ||= AdminAbility.new(current_admin)
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || admin_overviews_path
  end
  
  
end
