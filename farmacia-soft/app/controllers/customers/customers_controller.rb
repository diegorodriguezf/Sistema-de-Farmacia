# frozen_string_literal: true

class Customers::CustomersController < ApplicationController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  #before_action :authenticate_user!
  # GET /resource/sign_up
    before_action :require_login

   def new
     @customer=Customer.new
     render 'customers/new'
   end
   def create
       @customer = Customer.new(customer_params)
        if @customer.save
            flash[:notice] = 'Se ha guardado correctamente el registro'
            redirect_to sign_up_path
        else
            render 'customers/new'
        end
   end

  def edit
     @customer = Customer.find(params[:id])
      render 'customers/edit'
  end

   def update
      @customer= Customer.find(params[:id])
        respond_to do |format|
          if @customer.update_attributes(customer_params)
                flash[:notice] = 'Se ha actualizado correctamente el registro'
                format.html { redirect_to edit_customer_path(@customer)}
                format.json { head :no_content }
           else
            format.html { redirect_to edit_customer_path(@customer)}
            format.json { render json: @customer.errors, status: :unprocessable_entity }
          end
        end
  end

  def index
    @customers =Customer.all
    respond_to do |format|
      format.html {render 'customers/index'}
      format.json { render json: @customers }
    end
  end

  def destroy 
    @customer = Customer.find(params[:id])
    begin
      @user.destroy
      flash[:succesfull]= "Los datos del Cliente han sido eliminados"
      rescue
      flash[:error]= "Los datos del Cliente no se pueden eliminar"
      ensure
      respond_to do |format|
        format.html { redirect_to customer_index_path }
        format.json { head :no_content }
      end
    end
  end

  def customer_params
        params.require(:customer).permit(:first_name, :last_name,:doc_number,:birthdate,:address,:nationality,:phone,:sexo)
  end
end
