require 'bcrypt'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include BCrypt

 has_secure_password validations: false
  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable, :trackable, :validatable,:authentication_keys => [:username]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :password, presence: true
  validates :password,length: { minimum: 8}
  validates :password, confirmation: { case_sensitive: true }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: { case_sensitive: false, message: 'La dirección de correo electronico ya existe en el registro' }
  
  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end
end
