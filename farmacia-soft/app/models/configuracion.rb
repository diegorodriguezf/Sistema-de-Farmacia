class Configuracion < ApplicationRecord
 # validaciones de configuracion
  validates :nombre_empresa,:timbrado_id,presence: true
end
