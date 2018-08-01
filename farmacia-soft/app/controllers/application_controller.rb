class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   helper_method :current_user

    # Usuario actual
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
       return @current_user
    end

    # Requiere usuario
    def authenticate_user
    	if current_user.nil?
             redirect_to sign_in_path, alert: 'Necesita iniciar sesión para continuar' unless current_user  
      end
    end

end
