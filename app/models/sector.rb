class Sector < ApplicationRecord
  belongs_to :departamento
  has_many :recintos
  belongs_to :encargado, class_name: "Usuario", optional: true
end
