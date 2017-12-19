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
    p = Ingrediente.find(params[:ingredientes_id])
    o = Order.find_or_create_by(user: current_user, ingrediente: p, payed: false, price: p.price)
    o.quantity += 1

    if o.save
      redirect_to platos_path, notice: "El producto ha sido agregado al carro."
    else
      redirect_to platos_path, alert: "El producto NO ha sido agregado al carro"
    end
  end
end
