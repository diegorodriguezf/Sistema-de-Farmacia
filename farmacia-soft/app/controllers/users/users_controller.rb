# frozen_string_literal: true

class Users::UsersController < ApplicationController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  #before_action :authenticate_user!
  # GET /resource/sign_up
    before_action :require_login
   def new
     @user=User.new

     render 'users/new'
   end
   def create
       @user = User.new(user_params)
        if @user.save
            flash[:notice] = 'Se ha guardado correctamente el registro'
            redirect_to sign_up_path
        else
            render 'users/new'
        end
   end

  def edit
     @user = User.find(params[:id])
      render 'users/edit'
  end

   def update
      @user= User.find(params[:id])
        respond_to do |format|
          if @user.update_attributes(user_params)
                flash[:notice] = 'Se ha actualizado correctamente el registro'
                format.html { redirect_to edit_user_path(@user)}
                format.json { head :no_content }
           else
            format.html { redirect_to edit_user_path(@user)}
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
  end

  def show
     @user =User.find(params[:id])
     respond_to do |format|
       format.js {render 'users/open_modal_delete',content_type: 'text/javascript' }
       format.json { render json: @user }
    end
  end

  def index
    @users =User.all
    respond_to do |format|
      format.html {render 'users/index'}
      format.json { render json: @users }
    end
  end

  def destroy
    @user = User.find(params[:id])
    begin
      @user.destroy
      flash[:succesfull]= "Los datos del Usuario han sido eliminados"
      rescue
      flash[:error]= "Los datos del Usuario no se pueden eliminar"
      ensure
      respond_to do |format|
        format.html { redirect_to index_path }
        format.json { head :no_content }
      end
    end
  end

  def user_params
        params.require(:user).permit(:username, :password, :empleado_id)
  end
end
