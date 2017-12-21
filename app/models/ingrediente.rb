class Ingrediente < ApplicationRecord
  has_many :plato_creados
  has_many :platos, through: :plato_creados
end
