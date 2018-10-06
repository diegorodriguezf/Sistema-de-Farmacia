class Iva < ApplicationRecord
  has_many :ivas
  # validaciones de iva
   validates :descripcion,:valor,presence: true
end
