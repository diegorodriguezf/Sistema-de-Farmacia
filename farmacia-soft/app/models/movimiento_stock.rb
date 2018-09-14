class MovimientoStock < ApplicationRecord
  belongs_to :empleado, :foreign_key=>"empleado_id"

  def self.create(empleado_id,fecha,tipo_movimiento,descripcion)
    mov_stock=MovimientoStock.new(empleado_id,fecha,tipo_movimiento,descripcion)
    mov_stock.save
    return mov_stock
  end
end
