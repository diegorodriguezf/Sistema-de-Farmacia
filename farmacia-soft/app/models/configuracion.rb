class Configuracion < ApplicationRecord
  mount_uploader :logo_path, ImageUploader
  belongs_to :timbrado, :foreign_key=>"timbrado_id"
  # validaciones de configuracion
  validates :nombre_empresa,:timbrado_id,presence: true

 end
