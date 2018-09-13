# frozen_string_literal: true

class Empleados::EmpleadosController < ApplicationController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  #before_action :authenticate_user!
  # GET /resource/sign_up
    before_action :require_login

   def new
     @empleado=Empleado.new
     render 'empleados/new'
   end
   def create
       @empleado = Empleado.new(empleado_params)
        if @empleado.save
            flash[:notice] = 'Se ha guardado correctamente el registro'
            redirect_to empleado_new_path
        else
            render 'empleados/new'
        end
   end

  def edit
     @empleado = Empleado.find(params[:id])
      render 'empleados/edit'
  end

   def update
      @empleado= Empleado.find(params[:id])
        respond_to do |format|
          if @empleado.update_attributes(empleado_params)
                flash[:notice] = 'Se ha actualizado correctamente el registro'
                format.html { redirect_to edit_empleado_path(@empleado)}
                format.json { head :no_content }
           else
            format.html { render 'empleados/edit'}
            format.json { render json: @empleado.errors, status: :unprocessable_entity }
          end
        end
  end

  def index
    @Empleados =Empleado.all
    respond_to do |format|
      format.html {render 'empleados/index'}
      format.json { render json: @empleados }
    end
  end

  def destroy
    @empleado = Empleado.find(params[:id])
    begin
      @empleado.destroy
      flash[:succesfull]= "Los datos del empleado han sido eliminados"
      rescue
      flash[:error]= "Los datos del empleado no se pueden eliminar"
      ensure
      respond_to do |format|
        format.html { redirect_to empleado_index_path }
        format.json { head :no_content }
      end
    end
  end

  def empleado_params
        params.require(:empleado).permit(:nombre, :apellido,:fecha_ingreso,:fecha_salida,:nro_documento,:fecha_nacimiento,:direccion,:nacionalidad,:telefono,:sexo,:activo)
  end
end
