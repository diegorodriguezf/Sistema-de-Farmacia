class Cliente < ApplicationRecord
    has_many :factura_ventas
  # validaciones de clientes
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :nro_documento, presence: true,numericality: true,length: { minimum: 5}
  validates_uniqueness_of :nro_documento, conditions: -> { where(nro_documento: :nro_documento,nacionalidad: :nacionalidad) },messagge: 'El numero de documento ya existe'
  validates :nacimiento, presence: true
  validates :sexo,presence: true
end
