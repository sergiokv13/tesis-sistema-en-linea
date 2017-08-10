class Recinto < ApplicationRecord
  belongs_to :sector
  has_many :mesas
  belongs_to :encargado, class_name: "Usuario", optional: true
end
