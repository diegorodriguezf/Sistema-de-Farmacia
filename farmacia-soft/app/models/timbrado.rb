class Timbrado < ApplicationRecord

  has_many :configuraciones
  has_many :factura_ventas
  # validaciones de timbrados
  validates :timbrado,:serie,:nro_desde,:nro_hasta,:fecha_circulacion,:fecha_expiracion,presence: true
  validates :timbrado,numericality: true
  validates :timbrado, uniqueness: { case_sensitive: false }
  validates :nro_desde,numericality: true
  validates :nro_hasta,numericality: {greater_than: :nro_desde}
  validates :fecha_expiracion, date: { after: :fecha_circulacion, message: 'debe ser mayor a fecha de apertura' }

  def change_state_stamp_exp
    timbrado = Timbrado.where('fecha_expiracion < ?',Date.today)
    timbrado.update(:estado => 0)
  end
   # return if [fecha_circulacion.blank?, fecha_expiracion.blank?].any?
   # if fecha_circulacion > fecha_expiracion
    #  errors.add(:fecha_expiracion, 'El campo debe ser mayor a fecha_circulacion')
   # end
  #end
end
