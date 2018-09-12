class FacturaVenta < ApplicationRecord
  belongs_to :cliente, :foreign_key=>"cliente_id"
  has_many :detalle_factura_ventas
  # validaciones de factura venta
   validates :cliente_id,presence: true
end
