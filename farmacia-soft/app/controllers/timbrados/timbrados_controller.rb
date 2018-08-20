
class Timbrados::TimbradosController < ApplicationController
	 before_action :require_login

   def new
     @timbrado=Timbrado.new
     render 'timbrados/new'
   end
   def create
       @timbrado = Timbrado.new(timbrado_params)
        if @timbrado.save
            flash[:notice] = 'Se ha guardado correctamente el registro'
            redirect_to timbrado_new_path
        else
            render 'timbrados/new'
        end
   end

  def edit
     @timbrado = Timbrado.find(params[:id])
      render 'timbrados/edit'
  end

   def update
      @timbrado= Timbrado.find(params[:id])
        respond_to do |format|
          if @timbrado.update_attributes(timbrado_params)
                flash[:notice] = 'Se ha actualizado correctamente el registro'
                format.html { redirect_to edit_timbrado_path(@timbrado)}
                format.json { head :no_content }
           else
            format.html { render 'timbrados/edit'}
            format.json { render json: @timbrado.errors, status: :unprocessable_entity }
          end
        end
  end

  def show
     @timbrado = Timbrado.find(params[:id])
       respond_to do |format|
         if @timbrado
           format.html { render 'timbrados/show'}
           format.js { render 'timbrados/popup_show'}
         end
       end
  end

  def index
    @timbrados =Timbrado.all
    respond_to do |format|
      format.html {render 'timbrados/index'}
      format.json { render json: @timbrados }
    end
  end

  def destroy 
    @timbrado = Timbrado.find(params[:id])
    begin
      @timbrado.destroy
      flash[:succesfull]= "Los datos del Timbrado han sido eliminados"
      rescue
      flash[:error]= "Los datos del Timbrado no se pueden eliminar"
      ensure
      respond_to do |format|
        format.html { redirect_to timbrado_index_path }
        format.json { head :no_content }
      end
    end
  end

  def timbrado_params
        params.require(:timbrado).permit(:timbrado, :serie,:nro_desde,:nro_hasta,:fecha_circulacion,:fecha_expiracion,:estado)
  end
end
