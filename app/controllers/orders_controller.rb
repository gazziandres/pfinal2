class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    #@orders = current_user.orders {where(payed: false)}
    @orders = Order.where(user: current_user, payed: false)
    @total = @orders.get_total
  end

  def clean
    @orders = Order.where(user: current_user, payed: false)
    @orders.destroy_all
    redirect_to orders_path, notice: 'El carro se ha vaciado.'
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
  # POST /orders.json
  def create
    p = Plato.find(params[:plato_id])
    o = Order.find_or_create_by(user: current_user, plato: p, payed: false, price: p.price)
    o.quantity += 1

    if o.save
      redirect_to platos_path, notice: "El producto ha sido agregado al carro."
    else
      redirect_to platos_path, alert: "El producto NO ha sido agregado al carro"
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def address
  end
end
