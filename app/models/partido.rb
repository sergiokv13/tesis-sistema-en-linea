class Partido < ApplicationRecord
  belongs_to :votacion
  has_many :opcions

end
