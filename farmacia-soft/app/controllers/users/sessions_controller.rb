# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
  def  new
   super
  end

  # POST /resource/sign_in
  def create
   @user = User.find_by(username: params[:user][:username])
      respond_to do |format|
        if @user && @user.valid_password?(params[:user][:password])
                # Si el usuario existe y contraseña coincide
                session[:user_id] = @user.id
                 format.html{ redirect_to(dashboard_index_path, notice: "Bienvenido #{@user.first_name} #{@user.last_name},
                ha iniciado sesión correctamente"); }
                 format.js { render 'go_to_dashboard'}
            else # Usuario no existe
             
                flash[:notice] = 'Usuario o Contraseña incorrecta'
                format.js { render 'error_authentication', content_type: 'text/javascript'  }
                format.html { render :new }
            end

        end
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
