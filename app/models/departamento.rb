class Departamento < ApplicationRecord
  belongs_to :votacion
  has_many :sectors
  belongs_to :encargado, class_name: "Usuario", optional: true

end
