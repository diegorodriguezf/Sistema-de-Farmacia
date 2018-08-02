require 'bcrypt'
class User < ApplicationRecord
  authenticates_with_sorcery!
  include BCrypt
  # validaciones de usuario
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :password, presence: true
  validates :password,length: { minimum: 8}
  validates :password, confirmation: { case_sensitive: true,:on=>[:new,:edit]}
  
  def password
    @password ||= Password.new(crypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.crypted_password = @password
  end
end
