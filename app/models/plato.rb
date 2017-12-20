class Plato < ApplicationRecord
  has_many :orders, :dependent => :destroy
  has_many :users, through: :orders

  has_many :plato_creados
  has_many :ingredientes, through: :plato_creados
end
