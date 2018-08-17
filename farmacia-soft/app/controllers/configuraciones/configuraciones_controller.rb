# frozen_string_literal: true

class Configuraciones::ConfiguracionesController < ApplicationController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  #before_action :authenticate_user!
  # GET /resource/sign_up
    before_action :require_login

  def edit
     @configuracion = Configuracion.find(params[:id])
      render 'configuraciones/edit'
  end

   def update
      @configuracion= Configuracion.find(params[:id])
        respond_to do |format|
          if @configuracion.update_attributes(configuracion_params)
                flash[:notice] = 'Se ha actualizado correctamente el registro'
                format.html { redirect_to edit_configuracion_path(@configuracion)}
                format.json { head :no_content }
           else
            format.html { render 'configuraciones/edit'}
            format.json { render json: @configuracion.errors, status: :unprocessable_entity }
          end
        end
  end

  def configuracion_params
        params.require(:configuracion).permit(:nombre_empresa, :nombre_fantasia,:logo_path,:ruc,:direccion,:telefono,:timbrado_id)
  end
end
