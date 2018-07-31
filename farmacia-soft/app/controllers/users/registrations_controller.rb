# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
     self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
   end
   def create
       @user = User.new(user_params)
        if @user.save
            redirect_to sign_in_path, notice: 'Usuario registrado con éxito, necesita verificar su cuenta a través de su correo electrónico'
        else
            render :new
        end
   end

  def edit
     @user = User.find(params[:id])
  end
  def index
    @users =User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
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
  def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
    end
end
