class Configuracion < ApplicationRecord
  mount_uploader :logo_path, ImageUploader
  belongs_to :timbrado, :foreign_key=>"timbrado_id"
  belongs_to :moneda, :foreign_key=>"moneda_id"
  # validaciones de configuracion
  validates :nombre_empresa,:timbrado_id,:moneda_id,presence: true

 end
