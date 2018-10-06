class Facturaventas::FacturaventasController < ApplicationController
  before_action :require_login

 def new
   @factura_venta=FacturaVenta.new
   @factura_venta.fecha=Date.today.strftime("%d/%m/%Y").to_s
   @factura_venta.nomb_empleado=@current_user.empleado.nombre + ' ' + @current_user.empleado.apellido
   @factura_venta.empleado_id=@current_user.empleado.id
   @timbrado=Configuracion.first().timbrado
   @factura_venta.timbrado_id=@timbrado.id
   @nro_factura=FacturaVenta.where('timbrado_id',@timbrado.id).count() > 0 ?
                  (FacturaVenta.where('timbrado_id',@timbrado.id).last().nro_factura.to_s.split('-')[2].to_i+1).to_s :
                  Configuracion.first().timbrado.nro_desde.to_s
   @factura_venta.nro_factura=@timbrado.serie.to_s + '-' + @nro_factura
   @factura_venta.moneda_id=Configuracion.first().moneda_id
   DetalleFacturaVentaTmp.destroy_all
   @det_fac_venta_tmp =DetalleFacturaVentaTmp.new
   @det_fac_ventas_tmp=DetalleFacturaVentaTmp.all
   render 'facturaventas/new'
 end
 def create
     @factura_venta = FacturaVenta.new(factura_venta_params)
      if @factura_venta.save
          flash[:notice] = 'Se ha guardado correctamente el registro'
          #guardar el detalle de la Factura FacturaVenta
          @factura_venta_det_tmp=DetalleFacturaVentaTmp.all
          @factura_venta_det_tmp.each  do |detalle_factura_venta_tmp|
            @detalle_factura_venta.new(factura_venta_id: @factura_venta.id,medicamento_id: detalle_factura_venta_tmp.medicamento_id,
                                       cantidad: detalle_factura_venta_tmp.cantidad,exenta: detalle_factura_venta_tmp.exenta,
                                       iva5: detalle_factura_venta_tmp.iva5, iva10: detalle_factura_venta_tmp.iva10)

            @detalle_factura_venta.save
          end
          redirect_to factura_venta_new_path
      else
          render 'facturaventas/new'
      end
 end

def edit
   @factura_venta = FacturaVenta.find(params[:id])
    render 'facturaventas/edit'
end

 def update
    @factura_venta= FacturaVenta.find(params[:id])
      respond_to do |format|
        if @factura_venta.update_attributes(factura_venta_params)
              flash[:notice] = 'Se ha actualizado correctamente el registro'
              format.html { redirect_to edit_factura_venta_path(@factura_venta)}
              format.json { head :no_content }
         else
          format.html { render 'facturaventas/edit'}
          format.json { render json: @factura_venta.errors, status: :unprocessable_entity }
        end
      end
end
def confirm_factura
   @factura_venta=FacturaVenta.find(params[:id])
   if @factura_venta.update_attributes(confirmado: true)
      @factura_venta_det=@factura_venta.detalle_factura_ventas
      @mov_stock=MovimientoStock.create(@factura_venta.funcionario_id,Date.today,'Salida','Venta de Mercaderias segun Factura '+@factura_venta.nro_factura);
      @factura_venta_det.each  do |detalle_factura_venta|
        Stock.discount_stock(detalle_factura_venta.medicamento_id,detalle_factura_venta.cantidad)
     end
   end
end


def desconfirm_factura
  @factura_venta=FacturaVenta.find(params[:id])
  if @factura_venta.update_attributes(confirmado: false)
     @factura_venta_det=@factura_venta.detalle_factura_ventas
    @factura_venta_det.each  do |detalle_factura_venta|
       Stock.increase_stock(detalle_factura_venta.medicamento_id,detalle_factura_venta.cantidad)
    end
  end
end

def index
  @factura_venta =FacturaVenta.all
  respond_to do |format|
    format.html {render 'facturaventas/index'}
    format.json { render json: @factura_venta }
  end
end

def destroy
  @factura_venta = FacturaVenta.find(params[:id])
  begin
    @factura_venta.destroy
    flash[:succesfull]= "Los datos del factura_venta han sido eliminados"
    rescue
    flash[:error]= "Los datos del factura_venta no se pueden eliminar"
    ensure
    respond_to do |format|
      format.html { redirect_to factura_venta_index_path }
      format.json { head :no_content }
    end
  end
end

def factura_venta_params
      params.require(:factura_venta).permit(:fecha,:timbrado_id,:empleado_id,:cliente_id,:moneda_id,:nro_factura,
                                            :tipo_factura,:total_exentas,:total_iva5,:total_iva10,:total,:confirmado)
end
end
