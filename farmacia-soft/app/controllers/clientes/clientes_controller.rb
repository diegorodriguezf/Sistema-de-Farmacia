# frozen_string_literal: true

class Clientes::ClientesController < ApplicationController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  #before_action :authenticate_user!
  # GET /resource/sign_up
    before_action :require_login

   def new
     @cliente=Cliente.new
     render 'clientes/new'
   end
   def create
       @cliente = Cliente.new(cliente_params)
        if @cliente.save
            flash[:notice] = 'Se ha guardado correctamente el registro'
            redirect_to cliente_new_path
        else
            render 'clientes/new'
        end
   end

  def edit
     @cliente = Cliente.find(params[:id])
      render 'clientes/edit'
  end

   def update
      @cliente= Cliente.find(params[:id])
        respond_to do |format|
          if @cliente.update_attributes(cliente_params)
                flash[:notice] = 'Se ha actualizado correctamente el registro'
                format.html { redirect_to edit_cliente_path(@cliente)}
                format.json { head :no_content }
           else
            format.html { render 'clientes/edit'}
            format.json { render json: @cliente.errors, status: :unprocessable_entity }
          end
        end
  end

  def findById
     @cliente = Cliente.find(params[:id])
     @cliente.nombre=@cliente.nombre + ' ' + @cliente.apellido
     respond_to do |format|
       format.json { render json: @cliente }
     end
  end

  def index
    @clientes =Cliente.all
    respond_to do |format|
      format.html {render 'clientes/index'}
      format.json { render json: @clientes }
    end
  end

  def destroy
    @cliente = Cliente.find(params[:id])
    begin
      @cliente.destroy
      flash[:succesfull]= "Los datos del Cliente han sido eliminados"
      rescue
      flash[:error]= "Los datos del Cliente no se pueden eliminar"
      ensure
      respond_to do |format|
        format.html { redirect_to cliente_index_path }
        format.json { head :no_content }
      end
    end
  end

  def cliente_params
        params.require(:cliente).permit(:nombre, :apellido,:nro_documento,:nacimiento,:direccion,:nacionalidad,:telefono,:sexo)
  end
end
