class Votacion < ApplicationRecord
	has_many :departamentos
	has_many :partidos
	before_create :init
	after_create :set_asset

	def init
     	cmd = "multichain-cli cadena listpermissions issue"
		res = %x[#{cmd}]
		json_obj = res.delete("/n").delete(" ")
		direccion_principal = json_obj["address"].to_s
    end

    def set_asset
    	cmd = "multichain-cli cadena issue" + direccion_principal.to_s + " balotas " + self.numero_maximo_votantes + "1"
		res = %x[#{cmd}]
    end
end
