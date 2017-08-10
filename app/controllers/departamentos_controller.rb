class DepartamentosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_departamento, only: [:show, :edit, :update, :destroy]

  # GET /departamentos
  # GET /departamentos.json
  def index
    @departamentos = Departamento.all
  end

  # GET /departamentos/1
  # GET /departamentos/1.json
  def show
  end

  # GET /departamentos/new
  def new
    @departamento = Departamento.new
  end

  # GET /departamentos/1/edit
  def edit
  end


  def generar_cuenta
      departamento = Departamento.find(params[:id])
      nombre_separado = departamento.nombre_encargado.downcase.split(" ")
      email = nombre_separado.first + "." + nombre_separado.last + "departamento" + departamento.id.to_s + "@votacion.com"
      password = (0...8).map { (65 + rand(26)).chr }.join
      rol = "Encargado de departamento"
      password_reset = password
      if departamento.encargado == nil
        departamento.encargado = Usuario.create(email: email, password: password, rol: rol ,password_reset: password)
        departamento.save
      else
        encargado = Usuario.find_by_email(email)
        encargado.password = password
        encargado.password_reset = password
        encargado.save
      end
      redirect_to "/departamentos"
  end

  # POST /departamentos
  # POST /departamentos.json
  def create
    @departamento = Departamento.new(departamento_params)
    @departamento.votacion_id = Votacion.first.id
    respond_to do |format|
      if @departamento.save
        format.html { redirect_to @departamento, notice: 'Departamento was successfully created.' }
        format.json { render :show, status: :created, location: @departamento }
      else
        format.html { render :new }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departamentos/1
  # PATCH/PUT /departamentos/1.json
  def update
    respond_to do |format|
      if @departamento.update(departamento_params)
        format.html { redirect_to @departamento, notice: 'Departamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @departamento }
      else
        format.html { render :edit }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departamentos/1
  # DELETE /departamentos/1.json
  def destroy
    @departamento.destroy
    respond_to do |format|
      format.html { redirect_to departamentos_url, notice: 'Departamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departamento
      @departamento = Departamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def departamento_params
      params.require(:departamento).permit(:nombre, :numero_maximo_votantes, :votacion_id, :nombre_encargado)
    end
end
