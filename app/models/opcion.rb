class Opcion < ApplicationRecord
  	belongs_to :partido
	before_create :crear_direccion

	def crear_direccion
	  	cmd = "multichain-cli cadena getnewaddress"
		res = %x[#{cmd}]
		self.direccion =  res
	end
end
