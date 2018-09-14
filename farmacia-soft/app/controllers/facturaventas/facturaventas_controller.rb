class FacturaVentas::FacturaVentasController < ApplicationController
  before_action :require_login

 def new
   @factura_venta=FacturaVenta.new
   render 'factura_venta/new'
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
          render 'factura_venta/new'
      end
 end

def edit
   @factura_venta = FacturaVenta.find(params[:id])
    render 'factura_venta/edit'
end

 def update
    @factura_venta= FacturaVenta.find(params[:id])
      respond_to do |format|
        if @factura_venta.update_attributes(factura_venta_params)
              flash[:notice] = 'Se ha actualizado correctamente el registro'
              format.html { redirect_to edit_factura_venta_path(@factura_venta)}
              format.json { head :no_content }
         else
          format.html { render 'factura_venta/edit'}
          format.json { render json: @factura_venta.errors, status: :unprocessable_entity }
        end
      end
end
def confirm_factura
   @factura_venta=FacturaVenta.find(params[:id])
   if @factura_venta.update_attributes(:confirmado: true)
      @factura_venta_det=@factura_venta.detalle_factura_ventas
      @mov_stock=MovimientoStock.create(@factura_venta.funcionario_id,Date.today,'Salida','Venta de Mercaderias segun Factura '+@factura_venta.nro_factura);
      @factura_venta_det.each  do |detalle_factura_venta|
        Stock.discount_stock(detalle_factura_venta.medicamento_id,detalle_factura_venta.cantidad)
     end
   end
end


def desconfirm_factura
  @factura_venta=FacturaVenta.find(params[:id])
  if @factura_venta.update_attributes(:confirmado: true)
     @factura_venta_det=@factura_venta.detalle_factura_ventas
    @factura_venta_det.each  do |detalle_factura_venta|
       Stock.increase_stock(detalle_factura_venta.medicamento_id,detalle_factura_venta.cantidad)
    end
  end
end

def index
  @factura_venta =FacturaVenta.all
  respond_to do |format|
    format.html {render 'factura_venta/index'}
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
      params.require(:factura_venta).permit(:fecha,:cliente_id,:nro_factura,:tipo_factura,:total_exentas,:total_iva5,:total_iva10,:total,:confirmado)
end
end
