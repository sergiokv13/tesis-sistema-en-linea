class Partido < ApplicationRecord
  belongs_to :votacion
  has_many :opcions

  before_create :crear_direccion

    def crear_direccion
      	cmd = "multichain-cli cadena getnewaddress"
		#Saves the result of command in res
		res = %x[#{cmd}]
		#Gets the new address
		self.direccion =  res
    end

end
