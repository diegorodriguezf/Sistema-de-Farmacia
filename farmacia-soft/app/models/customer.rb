class Customer < ApplicationRecord
  # validaciones de clientes
  validates :first_name, presence: { messagge: 'El campo nombre no puede estar vacio'}
  validates :last_name, presence: true
  validates :doc_number, presence: true,numericality: true,length: { minimum: 5}
  validates_uniqueness_of :doc_number, conditions: -> { where(doc_number: :doc_number,nationality: :nationality) },messagge: 'El numero de documento ya existe'
  validates :birthdate, presence: true
  validates :sexo,presence: true
end
