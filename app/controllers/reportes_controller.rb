class ReportesController < ApplicationController
	def get_reporte_total
		@resultados = Votacion.get_reporte_total
		render :json => @resultados
	end

	def get_reporte_departamentos
		@resultados = Votacion.get_reporte_departamentos
		render :json => @resultados
	end

	def get_reporte_sectores
		@resultados = Votacion.get_reporte_sectores
		render :json => @resultados
	end
end
