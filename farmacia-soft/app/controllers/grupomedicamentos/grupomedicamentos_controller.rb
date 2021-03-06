class Grupomedicamentos::GrupomedicamentosController < ApplicationController
  before_action :require_login

 def new
   @grupoMedicamento=TipoUso.new
   render 'grupomedicamentos/new'
 end
 def create
     @grupoMedicamento = TipoUso.new(grupoMedicamento_params)
      if @grupoMedicamento.save
          flash[:notice] = 'Se ha guardado correctamente el registro'
          redirect_to grupoMedicamento_new_path
      else
          render 'grupomedicamentos/new'
      end
 end

def edit
   @grupoMedicamento = TipoUso.find(params[:id])
    render 'grupomedicamentos/edit'
end

 def update
    @grupoMedicamento= TipoUso.find(params[:id])
      respond_to do |format|
        if @grupoMedicamento.update_attributes(grupoMedicamento_params)
              flash[:notice] = 'Se ha actualizado correctamente el registro'
              format.html { redirect_to edit_grupoMedicamento_path(@grupoMedicamento)}
              format.json { head :no_content }
         else
          format.html { render 'grupomedicamentos/edit'}
          format.json { render json: @grupoMedicamento.errors, status: :unprocessable_entity }
        end
      end
end
def findById
   @grupoMedicamentos = TipoUso.find(params[:tipo_uso_ids].split(' '))
   respond_to do |format|
     format.json { render json: @grupoMedicamentos }
   end
end
def index
  @grupoMedicamentos =TipoUso.all
  respond_to do |format|
    format.html {render 'grupomedicamentos/index'}
    format.json { render json: @grupoMedicamentos }
  end
end

def destroy
  @grupoMedicamento = TipoUso.find(params[:id])
  begin
    @grupoMedicamento.destroy
    flash[:succesfull]= "Los datos del grupoMedicamento han sido eliminados"
    rescue
    flash[:error]= "Los datos del grupoMedicamento no se pueden eliminar"
    ensure
    respond_to do |format|
      format.html { redirect_to grupoMedicamento_index_path }
      format.json { head :no_content }
    end
  end
end

def grupoMedicamento_params
      params.require(:tipo_uso).permit(:tipo_uso)
end
end
