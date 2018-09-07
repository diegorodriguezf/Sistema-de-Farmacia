
class Medicamentos::MedicamentosController < ApplicationController
	 before_action :require_login
   autocomplete :tipoUso, :tipo_uso,:extra_data => [:id,:tipo_uso],:display_value => :tipo_uso
   def new
     @medicamento=Medicamento.new
     render 'medicamentos/new'
   end
   def create
       @medicamento = Medicamento.new(medicamento_params)
        if @medicamento.save
            flash[:notice] = 'Se ha guardado correctamente el registro'
            redirect_to medicamento_new_path
        else
            render 'medicamentos/new'
        end
   end

  def edit
     @medicamento = Medicamento.find(params[:id])
		 respond_to do |format|
			 format.html { render 'medicamentos/edit'}
			 format.js { render 'medicamentos/edit', content_type: 'text/javascript'}
		end
  end

   def update
      @medicamento= Medicamento.find(params[:id])
			@medicamento.tipo_uso_ids=params[:medicamento][:tipo_uso_ids].split(',')
        respond_to do |format|
          if @medicamento.update_attributes(medicamento_params)
                flash[:notice] = 'Se ha actualizado correctamente el registro'
                format.html { redirect_to edit_medicamento_path(@medicamento)}
                format.json { head :no_content }
           else
            format.html { render 'medicamentos/edit'}
            format.json { render json: @medicamento.errors, status: :unprocessable_entity }
          end
        end
  end

  def show
     @medicamento = Medicamento.find(params[:id])
       respond_to do |format|
         if @medicamento
           format.html { render 'medicamentos/show'}
           format.js { render 'medicamentos/show', content_type: 'text/javascript'}
         end
       end
  end

  def index
    @medicamentos =Medicamento.all
    respond_to do |format|
      format.html {render 'medicamentos/index'}
      format.json { render json: @medicamentos }
    end
  end

  def destroy
    @medicamento = Medicamento.find(params[:id])
    begin
      @medicamento.destroy
      flash[:succesfull]= "Los datos del medicamento han sido eliminados"
      rescue
      flash[:error]= "Los datos del medicamento no se pueden eliminar"
      ensure
      respond_to do |format|
        format.html { redirect_to medicamento_index_path }
        format.json { head :no_content }
      end
    end
  end

  def medicamento_params
        params.require(:medicamento).permit(:nombre, :descripcion,:fecha_vencimiento,{tipo_uso_ids:[]},:present_med_id,:cant_comprimido,:cant_st_min,:cant_st_max,:precio_compra,:precio_venta,:modo_aplicacion,:especificacion,:activo)
  end
end
