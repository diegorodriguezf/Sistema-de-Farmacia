class DetalleFacturaVenta < ApplicationRecord
   belongs_to :factura_venta, :foreign_key=>"factura_venta_id"
   belongs_to :medicamento, :foreign_key=>"medicamento_id"
   # validaciones de detalle mov stock
    validates :medicamento_id,:cantidad,:exenta,:iva10,:iva5, presence: true
end
