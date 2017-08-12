class Partido < ApplicationRecord
  belongs_to :votacion
  has_many :opcions

  before_create :crear_direccion

    def crear_direccion
      	cmd = "multichain-cli effex-chain getnewaddress"
		#Saves the result of command in res
		res = %x[#{cmd}]
		#Gets the new address
		self.direccion =  res.split('}')[1][2..-2]
    end

end
