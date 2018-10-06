# frozen_string_literal: true

class Detallefacturaventastmp::DetallefacturaventastmpController < ApplicationController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  #before_action :authenticate_user!
  # GET /resource/sign_up
    before_action :require_login
   def create
       @det_fac_venta_tmp =DetalleFacturaVentaTmp.new(detalle_factura_venta_tmp_params)
       @desc_iva=Iva.find(Medicamento.find(@det_fac_venta_tmp.medicamento_id).iva_id).descripcion;
       case  @desc_iva
          when "10%"
             @det_fac_venta_tmp.iva10=Medicamento.find(@det_fac_venta_tmp.medicamento_id).precio_venta*@det_fac_venta_tmp.cantidad*Iva.find(Medicamento.find(@det_fac_venta_tmp.medicamento_id).iva_id).valor
          when "5%"
             @det_fac_venta_tmp.iva5=Medicamento.find(@det_fac_venta_tmp.medicamento_id).precio_venta*@det_fac_venta_tmp.cantidad*Iva.find(Medicamento.find(@det_fac_venta_tmp.medicamento_id).iva_id).valor
          else
             @det_fac_venta_tmp.exenta=Medicamento.find(@det_fac_venta_tmp.medicamento_id).precio_venta*@det_fac_venta_tmp.cantidad*Iva.find(Medicamento.find(@det_fac_venta_tmp.medicamento_id).iva_id).valor
       end
      if @det_fac_venta_tmp.save
          index
          format.js {render 'detallefacturaventas/create'}
        end
   end

  def edit
     @det_fac_venta_tmp = DetalleFacturaVentaTmp.find(params[:id])
      render 'empleados/edit'
  end

   def update
      @det_fac_venta_tmp= DetalleFacturaVentaTmp.find(params[:id])
      @desc_iva=Iva.find(Medicamento.find(@det_fac_venta_tmp.medicamento_id).iva_id).descripcion;
      case  @desc_iva
         when "10%"
            @det_fac_venta_tmp.iva10=Medicamento.find(@det_fac_venta_tmp.medicamento_id).precio_venta*@det_fac_venta_tmp.cantidad*Iva.find(Medicamento.find(@det_fac_venta_tmp.medicamento_id).iva_id).valor
         when "5%"
            @det_fac_venta_tmp.iva5=Medicamento.find(@det_fac_venta_tmp.medicamento_id).precio_venta*@det_fac_venta_tmp.cantidad*Iva.find(Medicamento.find(@det_fac_venta_tmp.medicamento_id).iva_id).valor
         else
            @det_fac_venta_tmp.exenta=Medicamento.find(@det_fac_venta_tmp.medicamento_id).precio_venta*@det_fac_venta_tmp.cantidad*Iva.find(Medicamento.find(@det_fac_venta_tmp.medicamento_id).iva_id).valor
      end
        respond_to do |format|
          if @det_fac_venta_tmp.update_attributes(detalle_factura_venta_tmp_params)
             format.js {render 'detallefacturaventas/update'}
          end
        end
  end
 def create_or_update
   if params[:id].nil?
      update
    else
      create
   end
 end
  def index
    @det_fac_ventas_tmp =DetalleFacturaVentaTmp.all
  end

  def destroy
    @det_fac_venta_tmp = DetalleFacturaVentaTmp.find(params[:id])
    begin
      @det_fac_venta_tmp.destroy
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

  def detalle_factura_venta_tmp_params
        params.require(:detalle_factura_venta_tmp).permit(:medicamento_id,:cantidad,:exenta,:iva10,:iva5)
  end
end
