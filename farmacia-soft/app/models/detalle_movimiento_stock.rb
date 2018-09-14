class DetalleMovimientoStock < ApplicationRecord
    belongs_to :medicamento, :foreign_key=>"medicamento_id"
    # validaciones de detalle mov stock
     validates :medicamento_id,:cantidad,presence: true
end
