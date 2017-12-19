class Plato < ApplicationRecord
  has_many :orders, :dependent => :destroy
  has_many :users, through: :orders

  has many :ingredientes, through: :plato_creado
end
