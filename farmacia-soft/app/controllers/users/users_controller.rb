# frozen_string_literal: true

class Users::UsersController < ApplicationController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  #before_action :authenticate_user!
  # GET /resource/sign_up
   def new
     super
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

  def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name)
    end
end
