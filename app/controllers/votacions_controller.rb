class VotacionsController < ApplicationController
  before_action :authenticate_user!, except: [:show_json, :finalizar_voto]
  before_action :set_votacion, only: [:show, :edit, :update, :destroy]
  require 'net/http'

  # GET /votacions
  # GET /votacions.json
  def index
    @votacions = Votacion.all
  end

  # GET /votacions/1
  # GET /votacions/1.json
  def show
  end

  def iniciar_votacion
    @votacion = Votacion.first
    @votacion.estado = "Durante la votación"
    @votacion.save
    redirect_to :root
  end

  def finalizar_votacion
    @votacion = Votacion.first
    @votacion.estado = "Votación finalizada"
    @votacion.save
    redirect_to :root
  end

  def show_json
    @votacion = Votacion.first
    render :json => @votacion
  end


  # GET /votacions/new
  def new
    @votacion = Votacion.new
  end


  def habilitar_papeleta
    @mesa = Mesa.where(:encargado_id => current_usuario.id).first
    @url_terminal =  @mesa.direccion + "/habilitar_papeleta"
    @mesa.cambiar_estado("votando")
  end

  def finalizar_voto
    @mesa = Mesa.where(:encargado_id => params[:user_id]).first
    @mesa_a_buscar = Mesa.find(params[:id])
    if @mesa.id == @mesa_a_buscar.id
      ActionCable.server.broadcast "refrescar", :event => "Refrescar", :id => params[:user_id]
      @mesa.cambiar_estado("esperando")
    end
  end

  # GET /votacions/1/edit
  def edit
  end

  def habilitar_terminal
    @mesa = Mesa.where(:encargado_id => current_usuario.id).first
    @mesa.direccion = "http://" + params[:direccion].to_s
    @url_terminal =  @mesa.direccion + "/set_id_en_linea/"+ @mesa.id.to_s + "/" + current_usuario.id.to_s
    @mesa.terminal_habilitada = true
    @mesa.save
  end

  def deshabilitar_terminal
     @mesa = Mesa.where(:encargado_id => current_usuario.id).first
     @mesa.terminal_habilitada = false
     @mesa.estado = "esperando"
     @mesa.save
     redirect_to :root
  end

  def visualizar_papeleta
    @votacion = Votacion.first
    @partidos = Partido.all
    render :layout => false
  end

  # POST /votacions
  # POST /votacions.json
  def create
    @votacion = Votacion.new(votacion_params)
    @votacion.etapa = "Previa a la votación."
    respond_to do |format|
      if @votacion.save
        format.html { redirect_to @votacion, notice: 'La votación se creo correctamente.' }
        format.json { render :show, status: :created, location: @votacion }
      else
        format.html { render :new }
        format.json { render json: @votacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votacions/1
  # PATCH/PUT /votacions/1.json
  def update
    respond_to do |format|
      if @votacion.update(votacion_params)
        format.html { redirect_to @votacion, notice: 'La votación se edito correctamente.' }
        format.json { render :show, status: :ok, location: @votacion }
      else
        format.html { render :edit }
        format.json { render json: @votacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votacions/1
  # DELETE /votacions/1.json
  def destroy
    @votacion.destroy
    respond_to do |format|
      format.html { redirect_to votacions_url, notice: 'Votacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_votacion
      @votacion = Votacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def votacion_params
      params.require(:votacion).permit(:razon, :inicio, :finalizacion, :numero_maximo_votantes, :numero_maximo_autenticaciones, :tiempo_maximo_votos, :balotas)
    end
end
