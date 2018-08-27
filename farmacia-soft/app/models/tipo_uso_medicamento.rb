class TipoUsoMedicamento < ApplicationRecord
	belongs_to :medicamento, :foreign_key=>"medicamento_id"
	belongs_to :tipo_uso, :foreign_key=>"tipo_medicamento_uso_id"
end
