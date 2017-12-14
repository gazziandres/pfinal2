class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
<<<<<<< HEAD
=======
    @orders = current_user.orders {where(payed: false)}
    @total = @orders.get_total
>>>>>>> bbe88dae5c7edfb7113684d2497b0191e7b3618c
    @hash = Gmaps4rails.build_markers(@orders) do |order, marker|
      marker.lat order.latitude
      marker.lng order.longitude
    end
    if params[:latitude].present? && if params[:longitude].present?
      @orders = Order.near(
        [params[:latitude], params[:longitude]],
        100,
        units: :km
      )
    else
      @orders = Order.near(
        current_user.address,
        10_000,
        units: :km
      )
    end
<<<<<<< HEAD
    @orders = current_user.orders.cart
    @total = @orders.get_total
=======
>>>>>>> bbe88dae5c7edfb7113684d2497b0191e7b3618c
  end

  def clean
    @orders = Order.where(user: current_user, payed: false)
    @orders.destroy_all
    redirect_to orders_path, notice: 'El carro se ha vaciado.'
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
<<<<<<< HEAD
    p = Product.find(params[:product_id])
    o = Order.find_or_create_by(user: current_user, product: p, payed: false, price: p.price)
    o.quantity += 1

    if o.save
      redirect_to products_path, notice: "El producto ha sido agregado al carro."
    else
      redirect_to products_path, alert: "El producto NO ha sido agregado al carro"
=======
    p = Plato.find(params[:plato_id])
    o = Order.find_or_create_by(user: current_user, plato: p, payed: false, price: p.price, address: current_user.address)
    o.quantity += 1

    if o.save
      redirect_to platos_path, notice: "El producto ha sido agregado al carro."
    else
      redirect_to platos_path, alert: "El producto NO ha sido agregado al carro"
>>>>>>> bbe88dae5c7edfb7113684d2497b0191e7b3618c
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
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

<<<<<<< HEAD
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:checked_out_at, :address)
    end
=======
private
# Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:address, :phone)
>>>>>>> bbe88dae5c7edfb7113684d2497b0191e7b3618c
  end
end
