# frozen_string_literal: true

class Detallefacturaventastmp::DetallefacturaventastmpController < ApplicationController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  #before_action :authenticate_user!
  # GET /resource/sign_up
    before_action :require_login
    autocomplete :medicamento, :nombre,:extra_data => [:id,:nombre],:display_value => :nombre
   def create
       @desc_iva=Iva.find(Medicamento.find(params[:medicamento_id]).iva_id).descripcion;
       @exenta=0;
       @iva10=0;
       @iva5=0;
       case  @desc_iva
          when "10%"
             @iva10=Medicamento.find(params[:medicamento_id]).precio_venta*params[:cantidad].to_i*Iva.find(Medicamento.find(params[:medicamento_id]).iva_id).valor
          when "5%"
             @iva5=Medicamento.find(params[:medicamento_id]).precio_venta*params[:cantidad].to_i*Iva.find(Medicamento.find(params[:medicamento_id]).iva_id).valor
          else
             @exenta=Medicamento.find(params[:medicamento_id]).precio_venta*params[:cantidad].to_i*Iva.find(Medicamento.find(params[:medicamento_id]).iva_id).valor
       end
       @subtotal=Medicamento.find(params[:medicamento_id]).precio_venta*params[:cantidad].to_i
       @det_fac_venta_tmp =DetalleFacturaVentaTmp.new(medicamento_id: params[:medicamento_id],cantidad: params[:cantidad],
                                                    exenta: @exenta,iva10: @iva10,iva5: @iva5,subtotal: @subtotal)
      respond_to do |format|
        if @det_fac_venta_tmp.save
            index
            format.js {render 'detallefacturaventas/create'}
        end
       end
   end

  def edit
     @det_fac_venta_tmp = DetalleFacturaVentaTmp.find(params[:id])
      render 'detallefacturaventas/edit'
  end

   def update
      @det_fac_venta_tmp= DetalleFacturaVentaTmp.find(params[:id])
      @desc_iva=Iva.find(Medicamento.find(params[:medicamento_id]).iva_id).descripcion;
      @exenta=0;
      @iva10=0;
      @iva5=0;
      case  @desc_iva
         when "10%"
            @iva10=Medicamento.find(params[:medicamento_id]).precio_venta*params[:cantidad].to_i*Iva.find(Medicamento.find(params[:medicamento_id]).iva_id).valor
         when "5%"
            @iva5=Medicamento.find(params[:medicamento_id]).precio_venta*params[:cantidad].to_i*Iva.find(Medicamento.find(params[:medicamento_id]).iva_id).valor
         else
            @exenta=Medicamento.find(params[:medicamento_id]).precio_venta*params[:cantidad].to_i*Iva.find(Medicamento.find(params[:medicamento_id]).iva_id).valor
      end
        respond_to do |format|
          if @det_fac_venta_tmp.update_attributes(medicamento_id: params[:medicamento_id],cantidad: params[:cantidad],
                                                  exenta: @exenta,iva10: @iva10,iva5: @iva5)
             index
             format.js {render 'detallefacturaventas/update'}
          end
        end
  end
 def create_or_update
   if params[:id].empty?
      create
    else
      update
   end
 end

 def totales
 end
  def index
    @det_fac_ventas_tmp =DetalleFacturaVentaTmp.all
  end

  def destroy
    @det_fac_venta_tmp = DetalleFacturaVentaTmp.find(params[:id])
    @det_fac_venta_tmp.destroy
      index
      respond_to do |format|
           format.js {render 'detallefacturaventas/destroy'}
      end
  end

#  def detalle_factura_venta_tmp_params
  #      params.require(:detalle_factura_venta_tmp).permit(:medicamento_id,:cantidad,:exenta,:iva10,:iva5)
  #end
end
