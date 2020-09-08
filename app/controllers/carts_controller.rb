class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def index
    @cart = currentCart
    @carts = Cart.all.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @cart = currentCart
  end

  def new
    @cart = currentCart
    @cart = Cart.new
  end

  def edit
    @cart = currentCart
  end

  def create
    @cart = currentCart
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = currentCart
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = currentCart
    @cart = currentCart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Đã xóa!' }
      format.json { head :no_content }
    end
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
      session[:cart_id] = @cart.id
    end

    def cart_params
      params.fetch(:cart, {})
    end
end