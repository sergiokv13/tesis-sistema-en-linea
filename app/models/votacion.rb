class Votacion < ApplicationRecord
	has_many :departamentos
	has_many :partidos
	before_create :init
	after_create :set_asset

	def init
     	cmd = "multichain-cli cadena listpermissions issue"
		res = %x[#{cmd}]
		json_obj = res.delete("\n").delete(" ")
		new_obj = JSON.parse json_obj
		self.direccion_principal = new_obj.first["address"].to_s
        self.etapa = "Previo a la votación"
    end

    def set_asset
    	cmd = "multichain-cli cadena issue " + direccion_principal.to_s + " balotas " + self.numero_maximo_votantes.to_s
		res = %x[#{cmd}]
    end

    def self.get_reporte_total
    	cmd = "multichain-cli cadena getmultibalances"
    	res = %x[#{cmd}]
		new_obj = JSON.parse res
		resultados = Hash.new
		Opcion.all.each do |opcion|
			dir = opcion.direccion
			dir = dir.strip
			if new_obj[dir] != nil
				resultados[dir] = new_obj[dir].first["qty"]
			end
		end
    	return resultados
    end

    def self.get_reporte_mesas
    	mesas = Hash.new
    	Opcion.all.each do |opcion|
     		dir = opcion.direccion
			cmd = "multichain-cli cadena liststreamkeyitems root " + "'" + dir.to_s + "'"
     		res = %x[#{cmd}]
     		new_obj = JSON.parse res
     		new_obj.each do |obj|
     			s = obj["data"]
     			mesa_id = [s].pack('H*').force_encoding('utf-8') 
     			mesa_id = mesa_id.to_i
     			if mesas[mesa_id] == nil then mesas[mesa_id] = Hash.new end
     			if mesas[mesa_id][dir.strip] == nil then mesas[mesa_id][dir.strip]=1 else mesas[mesa_id][dir.strip]+=1 end 
     		end
     	end
     	return mesas
    end

     def self.get_reporte_sectores
     	mesas = Votacion.get_reporte_mesas
     	sectores = Hash.new
     	mesas.keys.each do |id_mesa|
     		mesa = Mesa.find(id_mesa)
     		id_sector = mesa.recinto.sector_id
            id_sector = Sector.find(id_sector).nombre
     		if sectores[id_sector] == nil then sectores[id_sector] = Hash.new end
     		mesas[id_mesa].keys.each do |partido|
     			if sectores[id_sector][partido] == nil then sectores[id_sector][partido]= mesas[id_mesa][partido] else sectores[id_sector][partido.strip]+=mesas[id_mesa][partido] end 
     		end
     	end
     	return sectores
     end

    def self.get_reporte_departamentos
    
        mesas = Votacion.get_reporte_mesas
        sectores = Hash.new
        mesas.keys.each do |id_mesa|
            mesa = Mesa.find(id_mesa)
            id_sector = mesa.recinto.sector_id
            if sectores[id_sector] == nil then sectores[id_sector] = Hash.new end
            mesas[id_mesa].keys.each do |partido|
                if sectores[id_sector][partido] == nil then sectores[id_sector][partido]= mesas[id_mesa][partido] else sectores[id_sector][partido.strip]+=mesas[id_mesa][partido] end 
            end
        end


    	departamentos = Hash.new
    	sectores.keys.each do |id_sector|
    		sector = Sector.find(id_sector)
    		id_departamento = sector.departamento_id
            id_departamento = Departamento.find(id_departamento).nombre
    		if departamentos[id_departamento] == nil then departamentos[id_departamento] = Hash.new end
    		sectores[id_sector].keys.each do |partido|
    			if departamentos[id_departamento][partido] == nil then departamentos[id_departamento][partido] = sectores[id_sector][partido] else departamentos[id_departamento][partido.strip]+=sectores[id_sector][partido] end 
    		end
    	end
    	return departamentos
    end


end
