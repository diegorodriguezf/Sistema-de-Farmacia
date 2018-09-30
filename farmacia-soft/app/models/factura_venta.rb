class FacturaVenta < ApplicationRecord

  attribute :nomb_empleado, :string
  attribute :nro_factura, :string
  belongs_to :timbrado, :foreign_key=>"timbrado_id"
  belongs_to :cliente, :foreign_key=>"cliente_id"
  belongs_to :empleado, :foreign_key=>"empleado_id"
  belongs_to :moneda, :foreign_key=>"moneda_id"
  has_many :detalle_factura_ventas
  # validaciones de factura venta
   validates :cliente_id,:moneda_id,presence: true
end
