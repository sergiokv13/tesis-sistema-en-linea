class WelcomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	@votacion = Votacion.first
  	if current_usuario.rol == "Encargado de departamento"
		@departamento = Departamento.where(:encargado_id => current_usuario.id).first
	end
	if current_usuario.rol == "Encargado de sector"
		@sector = Sector.where(:encargado_id => current_usuario.id).first
	end
	if current_usuario.rol == "Encargado de recinto"
		@recinto = Recinto.where(:encargado_id => current_usuario.id).first
	end
	if current_usuario.rol == "Encargado de mesa"
		@mesa = Mesa.where(:encargado_id => current_usuario.id).first
	end
  end
end
