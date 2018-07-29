# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
  def  new
     self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create
     @user = User.find_by(username: params[:user][:username])
     if @user && @user.valid_password?(params[:user][:password])
          # Si el usuario existe y contraseña coincide
           session[:user_id] = @user.id
           respond_to do |format|
             format.js { render 'go_to_dashboard'}
           end  
            else # Si el usuario o contraseña no coincide
                respond_to do |format|
                    flash[:notice] = 'Usuario o Contraseña incorrecta'
                    format.js { render 'error_authentication', content_type: 'text/javascript'  }
                end 
        end
  end

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
  end

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { methods: methods, only: [:password] }
  end


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

end
