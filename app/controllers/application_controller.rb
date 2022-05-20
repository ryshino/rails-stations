class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
    end

    def after_sign_in_path_for(resource)
      case resource
      when User
        user_path(resource.id)        
      when AdminUser
        admin_movies_path
      end
    end 
    
    def require_user_logged_in
      unless user_signed_in?
        flash[:notice] = "ログインが必要です"
        redirect_to new_user_session_path
      end
    end
end
