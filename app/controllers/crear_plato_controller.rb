class CrearPlatoController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @verdes = Ingrediente.where(id_tipo:1)
    @premium = Ingrediente.where(id_tipo:2)
    @esencial = Ingrediente.where(id_tipo:3)
    @otro = Ingrediente.where(id_tipo:4)
    @proteina = Ingrediente.where(id_tipo:5)
    @queso = Ingrediente.where(id_tipo:6)
  end

  def create
    i = Ingrediente.find(params[:id])
    p = PlatoCreado.find_or_create_by(ingrediente: i)

    if p.save
      redirect_to platos_path, notice: "El plato se ha creado."
    else
      redirect_to platos_path, alert: "El plato NO ha sido creado"
    end
  end
end
