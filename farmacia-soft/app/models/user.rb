require 'bcrypt'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include BCrypt
 # has_secure_password validations: false
  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable, :trackable, :validatable,:authentication_keys => [:username]

  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :password, presence: true
  validates :password,length: { minimum: 8}
  

  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end
end
