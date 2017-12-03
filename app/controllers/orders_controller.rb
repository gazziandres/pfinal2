class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_cart

  def create
    p = Plato.find(params[:plato_id])
    o = Order.find_or_create_by(user: current_user, plato: p, payed: false, price: p.price)
    o.quantity += 1
    if o.save
      redirect_to platos_path, notice: 'La orden ha sido ingresada'
    else
      redirect_to platos_path, alert: 'La orden NO ha podido ser ingresada'
    end
  end

  def clean
    @orders = Order.where(user: current_user, payed: false)
    @orders.destroy_all
    redirect_to orders_path, notice: 'El carro se ha vaciado.'
  end

  def index
    @orders = current_user.orders.cart
    @total = @orders.get_total
  end

  protected

  def find_cart
    @cart = session[:cart_id] ? Order.find(session[:cart_id]) : current_user.orders.build
  end
end
