class Stock < ApplicationRecord
  belongs_to :medicamento, :foreign_key=>"medicamento_id"

  def self.
    medicamento_id,cantidad)
    stock=Stock.find_by(medicamento_id: medicamento_id)
    stock.update_attributes(:cantidad => stock.cantidad-cantidad)
  end

  def self.increase_stock(medicamento_id,cantidad)
    stock=Stock.find_by(medicamento_id: medicamento_id)
    stock.update_attributes(:cantidad => stock.cantidad+cantidad)
  end
end
