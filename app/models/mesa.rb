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

end
