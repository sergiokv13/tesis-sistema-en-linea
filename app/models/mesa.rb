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
      s = "done"
      (0..Votacion.last.balotas-1).each do |c|
        cmd = "multichain-cli cadena sendwithdatafrom " + Votacion.last.direccion_principal.to_s.strip  + " " + direccion.to_s.strip + " '{" + '"balotas"' + ":1}' " + "'{" + '"for":"root","key":habilitar_balotas","data":"' + s.unpack('U'*s.length).collect {|x| x.to_s 16}.join.to_s + '"' + "}'"
        res = %x[#{cmd}]
      end
    end

end
