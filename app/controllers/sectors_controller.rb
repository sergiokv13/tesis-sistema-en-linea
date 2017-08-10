class SectorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sector, only: [:show, :edit, :update, :destroy]

  # GET /sectors
  # GET /sectors.json
  def index
    @sectors = Sector.all
  end

  # GET /sectors/1
  # GET /sectors/1.json
  def show
  end

  # GET /sectors/new
  def new
    @sector = Sector.new
  end

  # GET /sectors/1/edit
  def edit
  end

  def generar_cuenta
    sector = Sector.find(params[:id])
    nombre_separado = sector.nombre_encargado.downcase.split(" ")
    email = nombre_separado.first + "." + nombre_separado.last + "sector" + sector.id.to_s + "@votacion.com"
    password = (0...8).map { (65 + rand(26)).chr }.join
    rol = "Encargado de sector"
    password_reset = password
    if sector.encargado == nil
      sector.encargado = Usuario.create(email: email, password: password, rol: rol ,password_reset: password)
      sector.save
    else
      encargado = Usuario.find_by_email(email)
      encargado.password = password
      encargado.password_reset = password
      encargado.save
    end
    redirect_to "/departamento/sectores/" + sector.departamento.id.to_s
  end

  def departamento_index
    @sectors = Sector.where(:departamento_id => params[:id])
  end

  # POST /sectors
  # POST /sectors.json
  def create
    @sector = Sector.new(sector_params)
    @sector.departamento_id = Departamento.where(:encargado_id => current_usuario.id).first.id
    respond_to do |format|
      if @sector.save
        format.html { redirect_to @sector, notice: 'Sector was successfully created.' }
        format.json { render :show, status: :created, location: @sector }
      else
        format.html { render :new }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sectors/1
  # PATCH/PUT /sectors/1.json
  def update
    respond_to do |format|
      if @sector.update(sector_params)
        format.html { redirect_to @sector, notice: 'Sector was successfully updated.' }
        format.json { render :show, status: :ok, location: @sector }
      else
        format.html { render :edit }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sectors/1
  # DELETE /sectors/1.json
  def destroy
    @sector.destroy
    respond_to do |format|
      format.html { redirect_to sectors_url, notice: 'Sector was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sector
      @sector = Sector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sector_params
      params.require(:sector).permit(:nombre, :numero_maximo_votantes, :departamento_id , :nombre_encargado)
    end
end
