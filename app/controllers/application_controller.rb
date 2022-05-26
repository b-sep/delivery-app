class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User)
        user_hauler_path(current_user)
      else
        admin_delivery_app_path(current_user)
      end
  end  
end
