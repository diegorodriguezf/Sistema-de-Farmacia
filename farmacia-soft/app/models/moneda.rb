class Moneda < ApplicationRecord
  has_many :factura_ventas
  has_many :configuraciones
  validates :moneda,:decimales,presence: true
  validates :decimales,numericality: true
end
