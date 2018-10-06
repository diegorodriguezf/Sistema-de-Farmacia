class DetalleFacturaVentaTmp < ApplicationRecord
   belongs_to :medicamento, :foreign_key=>"medicamento_id"
end
