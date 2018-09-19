
class User < ApplicationRecord
  authenticates_with_sorcery!
   belongs_to :empleado, :foreign_key=>"empleado_id"
   has_secure_password validations: false
  # validaciones de usuario
  validates :username, presence: true,uniqueness: { case_sensitive: false, message: 'El usuario  %{value} ya existe ' }
  validates :password, :empleado_id,presence: true
  validates :password,length: { minimum: 8}
  validates :password, confirmation: { case_sensitive: true}

end
