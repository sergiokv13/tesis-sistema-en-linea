class Mesa < ApplicationRecord
  belongs_to :recinto
  belongs_to :encargado, class_name: "Usuario", optional: true

  before_create :init

    def init
      self.estado  = "esperando"
    end

    def cambiar_estado(nuevo_estado)
    	mesa = Mesa.find(self.id)
    	mesa.estado = nuevo_estado
    	mesa.save
    end

    def self.registrar_voto(direccion)
      cmd = "multichain-cli cadena sendfrom 1W4c5LHY2qzgYpXWbgdHJaLFvHeUDw9DiesWPm " +  direccion + " '" + '{"' + 'balotas"' + ":1}'"
      res = %x[#{cmd}]
      self.direccion_votante =  res
    end

end
