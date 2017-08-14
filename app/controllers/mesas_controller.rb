class MesasController < ApplicationController
  before_action :authenticate_user!, except: [:informar_direccion]
  before_action :set_mesa, only: [:show, :edit, :update, :destroy]

  # GET /mesas
  # GET /mesas.json
  def index
    @mesas = Mesa.all
  end

  # GET /mesas/1
  # GET /mesas/1.json
  def show
  end

  # GET /mesas/new
  def new
    @mesa = Mesa.new
  end

  # GET /mesas/1/edit
  def edit
  end

  def generar_cuenta
    mesa = Mesa.find(params[:id])
    nombre_separado = mesa.nombre_encargado.downcase.split(" ")
    email = nombre_separado.first + "." + nombre_separado.last + "mesa" + mesa.id.to_s + "@votacion.com"
    password = "drperro13"
    #(0...8).map { (65 + rand(26)).chr }.join
    rol = "Encargado de mesa"
    password_reset = password
    if mesa.encargado == nil
      mesa.encargado = Usuario.create(email: email, password: password, rol: rol ,password_reset: password)
      mesa.save
    else
      encargado = Usuario.find_by_email(email)
      encargado.password = password
      encargado.password_reset = password
      encargado.save
    end
    redirect_to "/recinto/mesas/" + mesa.recinto.id.to_s
  end

  def mesa_index
    @mesas = Mesa.where(:recinto_id => params[:id])
  end

  # POST /mesas
  # POST /mesas.json
  def create
    @mesa = Mesa.new(mesa_params)
    @mesa.recinto_id = Recinto.where(:encargado_id => current_usuario.id).first.id
    respond_to do |format|
      if @mesa.save
        format.html { redirect_to @mesa, notice: 'Mesa was successfully created.' }
        format.json { render :show, status: :created, location: @mesa }
      else
        format.html { render :new }
        format.json { render json: @mesa.errors, status: :unprocessable_entity }
      end
    end
  end

  def informar_direccion
    Mesa.registrar_voto(params[:direccion])
    puts "ACAAAAAAAAAAAAAAAAAAA!!!!" + params[:direccion].to_s
  end

  # PATCH/PUT /mesas/1
  # PATCH/PUT /mesas/1.json
  def update
    respond_to do |format|
      if @mesa.update(mesa_params)
        format.html { redirect_to @mesa, notice: 'Mesa was successfully updated.' }
        format.json { render :show, status: :ok, location: @mesa }
      else
        format.html { render :edit }
        format.json { render json: @mesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mesas/1
  # DELETE /mesas/1.json
  def destroy
    @mesa.destroy
    respond_to do |format|
      format.html { redirect_to mesas_url, notice: 'Mesa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mesa
      @mesa = Mesa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mesa_params
      params.require(:mesa).permit(:numero_maximo_votantes, :direccion_blockchain, :recinto_id, :nombre_encargado)
    end
end
