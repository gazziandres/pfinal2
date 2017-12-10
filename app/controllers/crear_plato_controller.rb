class CrearPlatoController < ApplicationController
  def index
    @verdes = Ingrediente.where(id_tipo:1)
    @premium = Ingrediente.where(id_tipo:2)
    @esencial = Ingrediente.where(id_tipo:3)
    @otro = Ingrediente.where(id_tipo:4)
    @proteina = Ingrediente.where(id_tipo:5)
    @queso = Ingrediente.where(id_tipo:6)
  end
end
