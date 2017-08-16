class ReportesController < ApplicationController
	def get_reporte_total
		@resultados = Votacion.get_reporte_total
		render :json => @resultados
	end
end
