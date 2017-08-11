class RecintosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recinto, only: [:show, :edit, :update, :destroy]

  # GET /recintos
  # GET /recintos.json
  def index
    @recintos = Recinto.all
  end

  # GET /recintos/1
  # GET /recintos/1.json
  def show
  end

  # GET /recintos/new
  def new
    @recinto = Recinto.new
  end

  # GET /recintos/1/edit
  def edit
  end

  def generar_cuenta
    recinto = Recinto.find(params[:id])
    nombre_separado = recinto.nombre_encargado.downcase.split(" ")
    email = nombre_separado.first + "." + nombre_separado.last + "recinto" + recinto.id.to_s + "@votacion.com"
    password = "drperro13"
    #(0...8).map { (65 + rand(26)).chr }.join
    rol = "Encargado de recinto"
    password_reset = password
    if recinto.encargado == nil
      recinto.encargado = Usuario.create(email: email, password: password, rol: rol ,password_reset: password)
      recinto.save
    else
      encargado = Usuario.find_by_email(email)
      encargado.password = password
      encargado.password_reset = password
      encargado.save
    end
    redirect_to "/sector/recintos/" + recinto.sector.id.to_s
  end

  # POST /recintos
  # POST /recintos.json
  def create
    @recinto = Recinto.new(recinto_params)
    @recinto.sector_id = Sector.where(:encargado_id => current_usuario.id).first.id
    respond_to do |format|
      if @recinto.save
        format.html { redirect_to @recinto, notice: 'Recinto was successfully created.' }
        format.json { render :show, status: :created, location: @recinto }
      else
        format.html { render :new }
        format.json { render json: @recinto.errors, status: :unprocessable_entity }
      end
    end
  end

  def sector_index
    @recintos = Recinto.where(:sector_id => params[:id])
  end


  # PATCH/PUT /recintos/1
  # PATCH/PUT /recintos/1.json
  def update
    respond_to do |format|
      if @recinto.update(recinto_params)
        format.html { redirect_to @recinto, notice: 'Recinto was successfully updated.' }
        format.json { render :show, status: :ok, location: @recinto }
      else
        format.html { render :edit }
        format.json { render json: @recinto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recintos/1
  # DELETE /recintos/1.json
  def destroy
    @recinto.destroy
    respond_to do |format|
      format.html { redirect_to recintos_url, notice: 'Recinto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recinto
      @recinto = Recinto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recinto_params
      params.require(:recinto).permit(:nombre, :numero_maximo_votantes, :sector_id,:nombre_encargado)
    end
end
