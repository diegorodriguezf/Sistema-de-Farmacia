class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # actualizar estado del timbrado si esta vencido
   timbrado=Timbrado.new
   timbrado.change_state_stamp_exp
end
