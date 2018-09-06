class TipoUso < ApplicationRecord
	has_many :tipo_uso_medicamentos
	validates :tipo_uso,presence: true
end
