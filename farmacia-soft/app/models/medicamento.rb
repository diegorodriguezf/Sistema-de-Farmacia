class Medicamento < ApplicationRecord
 belongs_to :presentacion_medicamento, :foreign_key=>"present_med_id"
 has_many :detalle_factura_ventas
has_many :stocks
 serialize :tipo_uso_ids,Array
 # validaciones de medicamento
  validates :nombre,:fecha_vencimiento,:cant_st_min,:cant_st_max,:precio_compra,:precio_venta,presence: true
  validates :cant_comprimido,:cant_st_min,:cant_st_max,:precio_compra,:precio_venta,numericality: true
  validates :cant_st_max,numericality: {greater_than: :cant_st_min}
end
