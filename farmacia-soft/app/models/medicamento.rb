class Medicamento < ApplicationRecord
 belongs_to :presentacion_medicamento, :foreign_key=>"present_med_id"
 has_many :tipo_uso_medicamentos
 # validaciones de medicamento
  validates :nombre,:fecha_vencimiento,:cant_stock_min,:cant_stock_max,:precio_compra,:precio_venta,presence: true
  validates :cant_stock_min,:cant_stock_max,:precio_compra,:precio_venta,numericality: true
end
