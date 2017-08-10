class Votacion < ApplicationRecord
	has_many :departamentos
	has_many :partidos
end
