
class User < ApplicationRecord
  authenticates_with_sorcery!

   has_secure_password validations: false
  # validaciones de usuario
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true,uniqueness: { case_sensitive: false, message: 'El usuario  %{value} ya existe ' }
  validates :password, presence: true
  validates :password,length: { minimum: 8}
  validates :password, confirmation: { case_sensitive: true}
  
end
