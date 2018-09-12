class Stocks::StocksController < ApplicationController
  # before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
    def discount_stock(medicamento_id,cantidad)
      @stock=Stock.find_by(medicamento_id: medicamento_id)
      @stock.update_attributes(:cantidad => @stock.cantidad-cantidad)
    end

    def increase_stock(medicamento_id,cantidad)
      @stock=Stock.find_by(medicamento_id: medicamento_id)
      @stock.update_attributes(:cantidad => @stock.cantidad+cantidad)
    end
end
