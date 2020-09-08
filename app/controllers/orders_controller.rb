class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @cart = currentCart
    @orders = Order.all
  end

  def show
    @cart = currentCart
  end

  def new
    @cart = currentCart
    if @cart.items.empty?
      redirect_to root_path, notice: 'Giỏ hàng rỗng!'
      return
    end
    @order = Order.new
  end

  def edit
    @cart = currentCart
  end

  def create
    @cart = currentCart
    @order = Order.new(order_params)
    @order.add_items_from_cart(currentCart)
    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, notice: 'Cảm ơn bạn đã mua hàng!' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = currentCart
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

  def destroy
    @cart = currentCart
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type, :cart_id)
    end
end