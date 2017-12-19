class Ingrediente < ApplicationRecord
  has_many :platos, through: :plato_creado
end
